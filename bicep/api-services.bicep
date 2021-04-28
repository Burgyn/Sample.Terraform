@minLength(1)
@maxLength(6)
param prefix string

@minLength(1)
@maxLength(15)
param deploymentEnvironment string

param appServicePlanSku object

param services array = []

param location string = resourceGroup().location

output services array = [for i in range(0, length(services)): {
  'name': services[i]
  'host': 'https://${api[i].properties.defaultHostName}'
}]

resource appServicePlan 'Microsoft.Web/serverfarms@2018-02-01' = {
  name: '${prefix}-${deploymentEnvironment}-eshop-plan'
  location: location
  sku: appServicePlanSku
}

resource api 'Microsoft.Web/sites@2018-11-01' = [for service in services: {
  name: '${prefix}-${deploymentEnvironment}-eshop-${service}-api'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    clientAffinityEnabled: false
    siteConfig: {
      netFrameworkVersion: 'v4.0'
      use32BitWorkerProcess: false
      http20Enabled: true
      alwaysOn: false
      webSocketsEnabled: false
      ftpsState: 'Disabled'

      appSettings: [
        {
          name: 'WEBSITE_ENABLE_SYNC_UPDATE_SITE'
          value: 'true'
        }
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        }
      ]
    }
  }
}]
