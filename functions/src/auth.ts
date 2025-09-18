import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();

export const createUser = functions.https.onCall(async (data, context) => {
  try {
    const { email, password, displayName } = data;
    const userRecord = await admin.auth().createUser({
      email,
      password,
      displayName,
    });
    await admin.auth().setCustomUserClaims(userRecord.uid, { role: 'user' });
    return {
      uid: userRecord.uid,
    };
  } catch (error) {
    if (error instanceof Error) {
        throw new functions.https.HttpsError('internal', error.message);
    }
    throw new functions.https.HttpsError('internal', 'An unknown error occurred');
  }
});
