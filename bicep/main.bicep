@minLength(1)
@maxLength(6)
param prefix string = 'gabo'

@minLength(1)
@maxLength(10)
param deploymentEnvironment string = 'bicep'

param location string = resourceGroup().location

@minLength(36)
@maxLength(36)
@description('User\'s object ID.')
param userId string = '4658beaf-0fb3-4b37-82ca-265de0168f44'

param appServicePlanSku object = {
  name: 'S1'
  tier: 'Standard'
  size: 'S1'
}

param elasticPoolSettings object = {
  sku: {
    name: 'StandardPool'
    tier: 'Standard'
    capacity: 100
  }
  maxSizeBytes: 100 * 1024 * 1024 * 1024
  perDatabaseSettings: {
    minCapacity: 0
    maxCapacity: 10
  }
}

@minLength(2)
param sqlServerAdminName string = 'superadmin'

@secure()
@minLength(12)
param sqlServerAdminPassword string = concat(uniqueString(newGuid()), toUpper(uniqueString(newGuid())))

var tenantId = subscription().tenantId

var serviceNames = [
  'authorization'
  'tenant'
  'users'
  'email'
  'basket'
  'catalog'
  'orders'
]

var databaseNames = [
  'authorization'
  'tenant'
  'users'
  'basket'
  'catalog'
  'orders'
]

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

module apiServices './api-services.bicep' = {
  name: 'apiServices'
  params: {
    prefix: prefix
    deploymentEnvironment: deploymentEnvironment
    location: location
    appServicePlanSku: appServicePlanSku
    services: serviceNames
  }
}

module databases './databases.bicep' = {
  name: 'databases'
  params: {
    prefix: prefix
    deploymentEnvironment: deploymentEnvironment
    location: location
    administratorLogin: sqlServerAdminName
    administratorLoginPassword: sqlServerAdminPassword
    elasticPoolSettings: elasticPoolSettings
    databases: databaseNames
  }
}
