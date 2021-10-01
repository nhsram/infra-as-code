param storageAccountName string
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
