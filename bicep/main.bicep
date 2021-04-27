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

param eshopPlanSku object = {
  name: 'S1'
  tier: 'Standard'
  size: 'S1'
}

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

resource appServicePlan 'Microsoft.Web/serverfarms@2018-02-01' = {
  name: '${prefix}-${deploymentEnvironment}-eshop-plan'
  location: location
  sku: eshopPlanSku
}

module baseApi './api-services.bicep' = {
  name: 'baseApi'
  params: {
    prefix: prefix
    deploymentEnvironment: deploymentEnvironment
    location: location
    appServicePlanId: appServicePlan.id
    services: [
      {
        name: 'authorization'
      }
      {
        name: 'tenant'
      }
      {
        name: 'users'
      }
      {
        name: 'email'
      }
    ]
  }
}

module eshopApi './api-services.bicep' = {
  name: 'eshopApi'
  params: {
    prefix: prefix
    deploymentEnvironment: deploymentEnvironment
    location: location
    appServicePlanId: appServicePlan.id
    services: [
      {
        name: 'catalog'
      }
      {
        name: 'basket'
      }
      {
        name: 'orders'
      }
    ]
  }
}
