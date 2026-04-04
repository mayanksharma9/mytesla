const crypto = require('crypto');
const fs = require('fs');

const privateKeyPem = fs.readFileSync('tesla_private_key.pem');
const key = crypto.createPrivateKey(privateKeyPem);
const jwk = key.export({ format: 'jwk' });

const dHex = Buffer.from(jwk.d, 'base64url').toString('hex');
console.log(dHex);
fs.writeFileSync('.env', `TESLA_PRIVATE_KEY_HEX=${dHex}\n`);
