const crypto = require('crypto');
const fs = require('fs');

const { publicKey, privateKey } = crypto.generateKeyPairSync('ec', {
  namedCurve: 'prime256v1',
  publicKeyEncoding: {
    type: 'spki',
    format: 'pem'
  },
  privateKeyEncoding: {
    type: 'pkcs8', 
    format: 'pem'
  }
});

// Save keys
fs.writeFileSync('tesla_private_key.pem', privateKey);

// The domain public key file format required by Tesla usually is just the base64 part
const pubKeyBase64 = publicKey
  .replace('-----BEGIN PUBLIC KEY-----', '')
  .replace('-----END PUBLIC KEY-----', '')
  .replace(/\n/g, '')
  .replace(/\r/g, '');

fs.writeFileSync('com.tesla.3p.public-key.pem', publicKey);
fs.writeFileSync('com.tesla.3p.pk', pubKeyBase64);

console.log('Keys generated successfully in PEM and base64 formats!');
