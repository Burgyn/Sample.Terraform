param sites_gabo_dev_eshop_users_api_name string = 'gabo-dev-eshop-users-api'
param serverfarms_gabo_dev_eshop_plan_name string = 'gabo-dev-eshop-plan'
param sites_gabo_dev_eshop_basket_api_name string = 'gabo-dev-eshop-basket-api'
param sites_gabo_dev_eshop_emails_api_name string = 'gabo-dev-eshop-emails-api'
param sites_gabo_dev_eshop_orders_api_name string = 'gabo-dev-eshop-orders-api'
param sites_gabo_dev_eshop_tenant_api_name string = 'gabo-dev-eshop-tenant-api'
param sites_gabo_dev_eshop_catalog_api_name string = 'gabo-dev-eshop-catalog-api'
param vaults_gabo_dev_settings_plan_name string = 'gabo-dev-settings-plan'
param sites_gabo_dev_eshop_authorization_api_name string = 'gabo-dev-eshop-authorization-api'

resource vaults_gabo_dev_settings_plan_name_resource 'Microsoft.KeyVault/vaults@2020-04-01-preview' = {
  name: vaults_gabo_dev_settings_plan_name
  location: 'westeurope'
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: 'edaf0c18-4de3-4e73-8d87-9231163218c7'
    accessPolicies: [
      {
        tenantId: 'edaf0c18-4de3-4e73-8d87-9231163218c7'
        objectId: '4658beaf-0fb3-4b37-82ca-265de0168f44'
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
          certificates: []
          storage: []
        }
      }
    ]
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    enableRbacAuthorization: false
    vaultUri: 'https://${vaults_gabo_dev_settings_plan_name}.vault.azure.net/'
    provisioningState: 'Succeeded'
  }
}

resource serverfarms_gabo_dev_eshop_plan_name_resource 'Microsoft.Web/serverfarms@2018-02-01' = {
  name: serverfarms_gabo_dev_eshop_plan_name
  location: 'West Europe'
  sku: {
    name: 'S1'
    tier: 'Standard'
    size: 'S1'
    family: 'S'
    capacity: 1
  }
  kind: 'Windows'
  properties: {
    perSiteScaling: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: false
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
  }
}

resource vaults_gabo_dev_settings_plan_name_Authorization_ConnectionStrings_DefaultConnection_dev 'Microsoft.KeyVault/vaults/secrets@2020-04-01-preview' = {
  name: '${vaults_gabo_dev_settings_plan_name_resource.name}/Authorization-ConnectionStrings-DefaultConnection-dev'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_gabo_dev_settings_plan_name_Basket_ConnectionStrings_DefaultConnection_dev 'Microsoft.KeyVault/vaults/secrets@2020-04-01-preview' = {
  name: '${vaults_gabo_dev_settings_plan_name_resource.name}/Basket-ConnectionStrings-DefaultConnection-dev'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_gabo_dev_settings_plan_name_Catalog_ConnectionStrings_DefaultConnection_dev 'Microsoft.KeyVault/vaults/secrets@2020-04-01-preview' = {
  name: '${vaults_gabo_dev_settings_plan_name_resource.name}/Catalog-ConnectionStrings-DefaultConnection-dev'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_gabo_dev_settings_plan_name_Orders_ConnectionStrings_DefaultConnection_dev 'Microsoft.KeyVault/vaults/secrets@2020-04-01-preview' = {
  name: '${vaults_gabo_dev_settings_plan_name_resource.name}/Orders-ConnectionStrings-DefaultConnection-dev'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_gabo_dev_settings_plan_name_Tenant_ConnectionStrings_DefaultConnection_dev 'Microsoft.KeyVault/vaults/secrets@2020-04-01-preview' = {
  name: '${vaults_gabo_dev_settings_plan_name_resource.name}/Tenant-ConnectionStrings-DefaultConnection-dev'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_gabo_dev_settings_plan_name_Users_ConnectionStrings_DefaultConnection_dev 'Microsoft.KeyVault/vaults/secrets@2020-04-01-preview' = {
  name: '${vaults_gabo_dev_settings_plan_name_resource.name}/Users-ConnectionStrings-DefaultConnection-dev'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource sites_gabo_dev_eshop_authorization_api_name_resource 'Microsoft.Web/sites@2018-11-01' = {
  name: sites_gabo_dev_eshop_authorization_api_name
  location: 'West Europe'
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_gabo_dev_eshop_authorization_api_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_gabo_dev_eshop_authorization_api_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_gabo_dev_eshop_plan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    siteConfig: {}
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    hostNamesDisabled: false
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
  }
}

resource sites_gabo_dev_eshop_basket_api_name_resource 'Microsoft.Web/sites@2018-11-01' = {
  name: sites_gabo_dev_eshop_basket_api_name
  location: 'West Europe'
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_gabo_dev_eshop_basket_api_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_gabo_dev_eshop_basket_api_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_gabo_dev_eshop_plan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    siteConfig: {}
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    hostNamesDisabled: false
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
  }
}

resource sites_gabo_dev_eshop_catalog_api_name_resource 'Microsoft.Web/sites@2018-11-01' = {
  name: sites_gabo_dev_eshop_catalog_api_name
  location: 'West Europe'
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_gabo_dev_eshop_catalog_api_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_gabo_dev_eshop_catalog_api_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_gabo_dev_eshop_plan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    siteConfig: {}
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    hostNamesDisabled: false
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
  }
}

resource sites_gabo_dev_eshop_emails_api_name_resource 'Microsoft.Web/sites@2018-11-01' = {
  name: sites_gabo_dev_eshop_emails_api_name
  location: 'West Europe'
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_gabo_dev_eshop_emails_api_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_gabo_dev_eshop_emails_api_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_gabo_dev_eshop_plan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    siteConfig: {}
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    hostNamesDisabled: false
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
  }
}

resource sites_gabo_dev_eshop_orders_api_name_resource 'Microsoft.Web/sites@2018-11-01' = {
  name: sites_gabo_dev_eshop_orders_api_name
  location: 'West Europe'
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_gabo_dev_eshop_orders_api_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_gabo_dev_eshop_orders_api_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_gabo_dev_eshop_plan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    siteConfig: {}
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    hostNamesDisabled: false
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
  }
}

resource sites_gabo_dev_eshop_tenant_api_name_resource 'Microsoft.Web/sites@2018-11-01' = {
  name: sites_gabo_dev_eshop_tenant_api_name
  location: 'West Europe'
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_gabo_dev_eshop_tenant_api_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_gabo_dev_eshop_tenant_api_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_gabo_dev_eshop_plan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    siteConfig: {}
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    hostNamesDisabled: false
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
  }
}

resource sites_gabo_dev_eshop_users_api_name_resource 'Microsoft.Web/sites@2018-11-01' = {
  name: sites_gabo_dev_eshop_users_api_name
  location: 'West Europe'
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_gabo_dev_eshop_users_api_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_gabo_dev_eshop_users_api_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_gabo_dev_eshop_plan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    siteConfig: {}
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    hostNamesDisabled: false
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
  }
}
