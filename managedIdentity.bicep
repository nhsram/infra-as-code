//az resource list --name 'ansibletowervm'

resource vm 'Microsoft.Compute/virtualMachines@2020-06-01' = {
  name: 'ansibletowervm' 
  location: 'northeurope'
  identity: {
    type:'SystemAssigned'
  }
}
output systemManagedIdentity string = vm.identity.principalId
