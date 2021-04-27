@minLength(1)
@maxLength(6)
param prefix string

@minLength(1)
@maxLength(15)
param deploymentEnvironment string

@minLength(1)
param location string = resourceGroup().location

param appServicePlanId string

param services array = []

resource api 'Microsoft.Web/sites@2018-11-01' = [for service in services: {
  name: '${prefix}-${deploymentEnvironment}-eshop-${service.name}-api'
  location: location
  properties: {
    serverFarmId: contains(service, 'appServicePlanId') && !empty(service.appServicePlanId) ? service.appServicePlanId : appServicePlanId
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
