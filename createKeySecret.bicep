param existingKeyVaultName string = 'testkeyvaultram'
param secretName string = 'superSecretPassword'

@secure()
param secretValue string 
param keyName string = 'testKey'

resource key 'Microsoft.KeyVault/vaults/keys@2019-09-01' = {
  name: '${existingKeyVaultName}/${keyName}'
  properties: {
    kty: 'RSA' // key type
    keyOps: [
      // key operations
      'encrypt'
      'decrypt'
    ]
    keySize: 4096
  }
}
// create secret
resource secret 'Microsoft.KeyVault/vaults/secrets@2018-02-14' = {
  name: '${existingKeyVaultName}/${secretName}'
  properties: {
    value: secretValue
  }
}
output proxyKey object = key
