# deploy_proxy.ps1
# Automates the deployment of the VoltRide TVCP Proxy to Google Cloud Run

$PROJECT_ID = "myteslat"
$SERVICE_NAME = "voltride-proxy"
$REGION = "us-central1"

# 1. Read Private Key from .env (Local check)
if (!(Test-Path .env)) {
    Write-Error "Could not find .env file in proxy_backend directory."
    exit
}

$envFile = Get-Content .env
$privateKeyHex = ""
$firestoreProjectId = ""
$firestoreApiKey = ""
foreach ($line in $envFile) {
    if ($line.StartsWith("TESLA_PRIVATE_KEY_HEX=")) {
        $privateKeyHex = $line.Split("=", 2)[1].Trim()
    }
    if ($line.StartsWith("FIRESTORE_PROJECT_ID=")) {
        $firestoreProjectId = $line.Split("=", 2)[1].Trim()
    }
    if ($line.StartsWith("FIRESTORE_API_KEY=")) {
        $firestoreApiKey = $line.Split("=", 2)[1].Trim()
    }
}

if ($privateKeyHex -eq "") {
    Write-Error "Could not find TESLA_PRIVATE_KEY_HEX in .env file."
    exit
}
if ($firestoreProjectId -eq "") {
    Write-Error "Could not find FIRESTORE_PROJECT_ID in .env file."
    exit
}
if ($firestoreApiKey -eq "") {
    Write-Error "Could not find FIRESTORE_API_KEY in .env file."
    exit
}

Write-Host "DEPROYING: $SERVICE_NAME to Google Cloud Run in $REGION..."

# 2. Build and Deploy to Cloud Run
# Using a single line command and avoiding all special characters in strings
gcloud run deploy $SERVICE_NAME --source . --project $PROJECT_ID --region $REGION --platform managed --allow-unauthenticated --set-env-vars "TESLA_PRIVATE_KEY_HEX=$privateKeyHex,FIRESTORE_PROJECT_ID=$firestoreProjectId,FIRESTORE_API_KEY=$firestoreApiKey" --quiet

if ($LASTEXITCODE -eq 0) {
    Write-Host "DEPLOYMENT SUCCESSFUL!"
    $serviceUrl = gcloud run services describe $SERVICE_NAME --platform managed --region $REGION --format 'value(status.url)'
    Write-Host "SERVICE URL: $serviceUrl"
    Write-Host "Please ensure your mobile app configuration reflects this URL."
} else {
    Write-Error "DEPLOYMENT FAILED. Please check the logs above."
}
