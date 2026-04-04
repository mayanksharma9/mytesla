# Teslame TVCP Proxy

This is a Dart Serverless backend proxy that securely signs Tesla Vehicle Command Protocol (TVCP) commands on behalf of your Flutter app.

By moving the signing logic here, your Application Private Key is never bundled inside your Flutter app, making your architecture secure and ready for the App Store (similar to how Tessie works).

## How it works
1. The Flutter App sends a standard HTTP POST request to `/api/command/<vin>/<command_name>` with the user's OAuth token in the `Authorization` header.
2. The proxy automatically handles the complex TVCP ECDH Handshake and Session tracking.
3. The proxy securely signs the command using your Developer Domain Private Key and forwards it to the Tesla Fleet API.
4. The response is returned directly to your Flutter app.

## Local Development
To run this proxy locally for testing:
```bash
dart run bin/server.dart
```
Ensure your `.env` file contains `TESLA_PRIVATE_KEY_HEX` and `TESLA_PUBLIC_KEY_B64`.

## Deployment to Google Cloud Run (myteslat)
Since you are using Firebase/GCP, you can deploy this proxy effortlessly using the Google Cloud CLI.
Run this from inside the `proxy_backend` directory:

```bash
gcloud run deploy teslame-proxy \
  --source . \
  --region us-central1 \
  --allow-unauthenticated \
  --set-env-vars="TESLA_PRIVATE_KEY_HEX=<INSERT_YOUR_HEX_KEY>,TESLA_PUBLIC_KEY_B64=<INSERT_PUB_KEY>"
```
*(You can find the variable values inside your local `.env` file).*

After deployment, copy the generated Cloud Run HTTPS URL and update the `.env` file in your Flutter app:
`TESLA_PROXY_URL=https://teslame-proxy-...a.run.app`
