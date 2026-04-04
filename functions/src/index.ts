import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import axios from "axios";

admin.initializeApp();
const db = admin.firestore();

// Note: In production, the Tesla API token should be stored securely 
// (e.g., in Secret Manager or per-user in Firestore).
// For this polling to work, we need a way to get the user's access token.
// Assuming we have a collection `users` with their Tesla tokens.

export const pollTeslaTrips = functions.pubsub.schedule("every 5 minutes").onRun(async (context) => {
  console.log("Polling Tesla API for trips...");

  // Example: Iterate over users who have opted into trip logging
  const usersSnapshot = await db.collection("users").get();
  
  for (const doc of usersSnapshot.docs) {
    const userData = doc.data();
    const token = userData.tesla_access_token;
    if (!token) continue;

    try {
      // 1. Get vehicles for this user
      const vehiclesResp = await axios.get("https://fleet-api.prd.na.vn.cloud.tesla.com/api/1/vehicles", {
        headers: { "Authorization": `Bearer ${token}` }
      });

      const vehicles = vehiclesResp.data.response;

      for (const vehicle of vehicles) {
        // 2. Poll vehicle data
        const vehicleDataResp = await axios.get(`https://fleet-api.prd.na.vn.cloud.tesla.com/api/1/vehicles/${vehicle.vin}/vehicle_data`, {
            headers: { "Authorization": `Bearer ${token}` }
        });

        const vData = vehicleDataResp.data.response;
        if (!vData) continue;

        const driveState = vData.drive_state;
        const chargeState = vData.charge_state;
        const shiftState = driveState.shift_state; // D, R, N, P, or null
        const speed = driveState.speed || 0;

        const vehicleRef = db.collection("vehicles").doc(vehicle.vin);
        const activeTripQuery = await vehicleRef.collection("trips").where("status", "==", "active").limit(1).get();

        const timestamp = admin.firestore.FieldValue.serverTimestamp();
        const location = new admin.firestore.GeoPoint(driveState.latitude, driveState.longitude);

        if ((shiftState === 'D' || shiftState === 'R' || speed > 0)) {
          // Car is driving
          if (activeTripQuery.empty) {
            // Start a new trip
            await vehicleRef.collection("trips").add({
              status: "active",
              start_time: timestamp,
              start_location: location,
              start_odometer: vData.vehicle_state.odometer,
              start_battery_level: chargeState.battery_level,
              route_points: [{ lat: driveState.latitude, lon: driveState.longitude, ts: Date.now() }],
            });
            console.log(`Started new trip for ${vehicle.vin}`);
          } else {
            // Update existing trip with new route points
            const tripDoc = activeTripQuery.docs[0];
            const tripData = tripDoc.data();
            const routePoints = tripData.route_points || [];
            routePoints.push({ lat: driveState.latitude, lon: driveState.longitude, ts: Date.now() });

            await tripDoc.ref.update({
              route_points: routePoints,
              current_speed: speed
            });
          }
        } else {
          // Car is parked (shiftState P or null and speed == 0)
          if (!activeTripQuery.empty) {
            // End the active trip
            const tripDoc = activeTripQuery.docs[0];
            const tripData = tripDoc.data();
            
            const distance = vData.vehicle_state.odometer - tripData.start_odometer;
            const energyUsed = tripData.start_battery_level - chargeState.battery_level; // simplistic % difference

            await tripDoc.ref.update({
              status: "completed",
              end_time: timestamp,
              end_location: location,
              end_odometer: vData.vehicle_state.odometer,
              end_battery_level: chargeState.battery_level,
              distance_miles: distance,
              energy_used_percent: energyUsed
            });
            console.log(`Completed trip for ${vehicle.vin}`);
          }
        }
      }
    } catch (e) {
      console.error(`Error polling for user ${doc.id}:`, e);
    }
  }
});
