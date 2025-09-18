"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.exchangeTokens = void 0;
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios_1 = require("axios");
const TESLA_API_BASE_URL = "https://owner-api.teslamotors.com";
// NOTE: In a real app, these would be stored securely in Firebase Function configuration
const CLIENT_ID = "your_tesla_client_id";
const CLIENT_SECRET = "your_tesla_client_secret";
exports.exchangeTokens = functions.https.onCall(async (data, context) => {
    const { refreshToken } = data;
    if (!refreshToken) {
        throw new functions.https.HttpsError("invalid-argument", "The function must be called with one argument \"refreshToken\" containing the user's refresh token.");
    }
    try {
        // 1. Exchange the refresh token for a Tesla access token
        const response = await axios_1.default.post(`${TESLA_API_BASE_URL}/oauth/token`, {
            grant_type: "refresh_token",
            client_id: CLIENT_ID,
            client_secret: CLIENT_SECRET,
            refresh_token: refreshToken,
        }, {
            headers: { "Content-Type": "application/json" },
        });
        const { access_token: teslaAccessToken, refresh_token: newTeslaRefreshToken } = response.data;
        // 2. Use the access token to get the user's Tesla profile
        const profileResponse = await axios_1.default.get(`${TESLA_API_BASE_URL}/api/1/users/me`, {
            headers: { Authorization: `Bearer ${teslaAccessToken}` },
        });
        const teslaUserId = profileResponse.data.response.id;
        // 3. Create a Firebase custom token
        const firebaseToken = await admin.auth().createCustomToken(teslaUserId.toString());
        // 4. Return the new tokens to the client
        return {
            firebaseToken,
            teslaAccessToken,
            newTeslaRefreshToken,
        };
    }
    catch (error) {
        functions.logger.error("Error exchanging tokens:", error);
        throw new functions.https.HttpsError("internal", "An error occurred while exchanging tokens.");
    }
});
//# sourceMappingURL=auth.js.map