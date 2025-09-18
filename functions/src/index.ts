import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp();


export const beginTeslaOauth = functions.https.onCall(async (_data, context) => {
if (!context.auth) throw new functions.https.HttpsError('unauthenticated', 'Sign in first');
// Create a PKCE/OAuth state tied to uid and return the Tesla authorize URL
const authUrl = 'https://fleet-auth.prd.vn.cloud.tesla.com/oauth2/v3/thirdparty/authorize?...';
return { authUrl };
});


export const completeTeslaOauth = functions.https.onCall(async (data, context) => {
if (!context.auth) throw new functions.https.HttpsError('unauthenticated', 'Sign in first');
const code = data.code as string;
// Exchange code -> tokens with Tesla (server-side), store encrypted under /users/{uid}/tesla
// Never return tokens to client.
await admin.firestore().doc(`users/${context.auth.uid}/private/tesla`).set({ linked: true, updatedAt: admin.firestore.FieldValue.serverTimestamp() }, { merge: true });
return { ok: true };
});


export const vehicleCommand = functions.https.onCall(async (data, context) => {
if (!context.auth) throw new functions.https.HttpsError('unauthenticated', 'Sign in first');
const { tag, command, args } = data as { tag: string; command: string; args?: Record<string, unknown> };
// Use your Vehicle Command Proxy with the server-held private key; authorize using server-stored access token.
// Return only sanitized result.
return { ok: true, command, tag };
});


export const getDeviceData = functions.https.onCall(async (data, context) => {
if (!context.auth) throw new functions.https.HttpsError('unauthenticated', 'Sign in first');
const { tag } = data as { tag: string };
// Call Tesla device data endpoint from server (billable), cache briefly, return filtered view.
return { response: { tag, soc: 78, state: 'asleep' } };
});