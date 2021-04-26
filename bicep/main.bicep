@minLength(1)
@maxLength(6)
param prefix string = 'gabo'

@minLength(1)
@maxLength(15)
param deploymentEnvironment string = 'bicep'

@minLength(36)
@maxLength(36)
@description('User\'s object ID.')
param userId string = '4658beaf-0fb3-4b37-82ca-265de0168f44'

var location = resourceGroup().location
var tenantId = subscription().tenantId

resource keyVault 'Microsoft.KeyVault/vaults@2020-04-01-preview' = {
  name: '${prefix}-${deploymentEnvironment}-settings-plan'
  location: location
  properties: {
    tenantId: tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenantId
        objectId: userId
        permissions: {
          keys: [
            'get'
            'list'
            'create'
            'update'
            'wrapKey'
            'unwrapKey'
            'sign'
            'verify'
            'recover'
          ]
          secrets: [
            'get'
            'list'
            'set'
            'delete'
            'recover'
          ]
        }
      }
    ]
  }
}
