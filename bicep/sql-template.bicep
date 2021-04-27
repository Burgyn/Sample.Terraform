@secure()
param vulnerabilityAssessments_Default_storageContainerPath string
param servers_gabo_dev_eshop_sql_name string = 'gabo-dev-eshop-sql'

resource servers_gabo_dev_eshop_sql_name_resource 'Microsoft.Sql/servers@2020-08-01-preview' = {
  name: servers_gabo_dev_eshop_sql_name
  location: 'westeurope'
  properties: {
    administratorLogin: '4dm1n157r470r'
    version: '12.0'
    publicNetworkAccess: 'Enabled'
  }
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db 'Microsoft.Sql/servers/databases@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/gabo-dev-eshop-authorization-db'
  location: 'westeurope'
  sku: {
    name: 'BC_Gen5'
    tier: 'BusinessCritical'
    family: 'Gen5'
    capacity: 2
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    licenseType: 'LicenseIncluded'
    readScale: 'Disabled'
    storageAccountType: 'GRS'
    maintenanceConfigurationId: '/subscriptions/72b87c06-8ad2-494a-b209-99c87e831137/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
  }
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db 'Microsoft.Sql/servers/databases@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/gabo-dev-eshop-basket-db'
  location: 'westeurope'
  sku: {
    name: 'BC_Gen5'
    tier: 'BusinessCritical'
    family: 'Gen5'
    capacity: 2
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    licenseType: 'LicenseIncluded'
    readScale: 'Disabled'
    storageAccountType: 'GRS'
    maintenanceConfigurationId: '/subscriptions/72b87c06-8ad2-494a-b209-99c87e831137/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
  }
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db 'Microsoft.Sql/servers/databases@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/gabo-dev-eshop-catalog-db'
  location: 'westeurope'
  sku: {
    name: 'BC_Gen5'
    tier: 'BusinessCritical'
    family: 'Gen5'
    capacity: 2
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    licenseType: 'LicenseIncluded'
    readScale: 'Disabled'
    storageAccountType: 'GRS'
    maintenanceConfigurationId: '/subscriptions/72b87c06-8ad2-494a-b209-99c87e831137/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
  }
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db 'Microsoft.Sql/servers/databases@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/gabo-dev-eshop-orders-db'
  location: 'westeurope'
  sku: {
    name: 'BC_Gen5'
    tier: 'BusinessCritical'
    family: 'Gen5'
    capacity: 2
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    licenseType: 'LicenseIncluded'
    readScale: 'Disabled'
    storageAccountType: 'GRS'
    maintenanceConfigurationId: '/subscriptions/72b87c06-8ad2-494a-b209-99c87e831137/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
  }
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db 'Microsoft.Sql/servers/databases@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/gabo-dev-eshop-tenant-db'
  location: 'westeurope'
  sku: {
    name: 'BC_Gen5'
    tier: 'BusinessCritical'
    family: 'Gen5'
    capacity: 2
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    licenseType: 'LicenseIncluded'
    readScale: 'Disabled'
    storageAccountType: 'GRS'
    maintenanceConfigurationId: '/subscriptions/72b87c06-8ad2-494a-b209-99c87e831137/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
  }
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db 'Microsoft.Sql/servers/databases@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/gabo-dev-eshop-users-db'
  location: 'westeurope'
  sku: {
    name: 'BC_Gen5'
    tier: 'BusinessCritical'
    family: 'Gen5'
    capacity: 2
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    licenseType: 'LicenseIncluded'
    readScale: 'Disabled'
    storageAccountType: 'GRS'
    maintenanceConfigurationId: '/subscriptions/72b87c06-8ad2-494a-b209-99c87e831137/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
  }
}
