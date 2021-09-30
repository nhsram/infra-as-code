param storageAccountName string
param containerName string = 'storageContainer'
param location string = resourceGroup().location

resource testStorageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'    
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  name: '${testStorageAccount.name}/default/${containerName}'
dependsOn: [
  testStorageAccount
  ]
}
