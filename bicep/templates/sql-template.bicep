@secure()
param vulnerabilityAssessments_Default_storageContainerPath string
param servers_gabo_dev_eshop_sql_name string = 'gabo-dev-eshop-sql'

resource servers_gabo_dev_eshop_sql_name_resource 'Microsoft.Sql/servers@2020-08-01-preview' = {
  name: servers_gabo_dev_eshop_sql_name
  location: 'westeurope'
  kind: 'v12.0'
  properties: {
    administratorLogin: '4dm1n157r470r'
    version: '12.0'
    publicNetworkAccess: 'Enabled'
  }
}

resource servers_gabo_dev_eshop_sql_name_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_gabo_dev_eshop_sql_name_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_gabo_dev_eshop_sql_name_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_gabo_dev_eshop_sql_name_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_gabo_dev_eshop_sql_name_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource servers_gabo_dev_eshop_sql_name_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/Default'
  location: 'West Europe'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_servers_gabo_dev_eshop_sql_name_Default 'Microsoft.Sql/servers/auditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
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
  kind: 'v12.0,user,vcore'
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
  kind: 'v12.0,user,vcore'
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
  kind: 'v12.0,user,vcore'
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
  kind: 'v12.0,user,vcore'
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
  kind: 'v12.0,user,vcore'
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
  kind: 'v12.0,user,vcore'
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

resource servers_gabo_dev_eshop_sql_name_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name}/master/Default'
  location: 'West Europe'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_gabo_dev_eshop_sql_name_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name}/master/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_gabo_dev_eshop_sql_name_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name}/master/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_gabo_dev_eshop_sql_name_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name}/master/Default'
  location: 'West Europe'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_gabo_dev_eshop_sql_name_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name}/master/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_master_current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name}/master/current'
  location: 'West Europe'
  properties: {
    status: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_gabo_dev_eshop_sql_name_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name}/master/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_current 'Microsoft.Sql/servers/encryptionProtector@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/current'
  kind: 'servicemanaged'
  properties: {
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
    autoRotationEnabled: false
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_servers_gabo_dev_eshop_sql_name_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_gabo_dev_eshop_sql_name_ServiceManaged 'Microsoft.Sql/servers/keys@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/ServiceManaged'
  kind: 'servicemanaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_securityAlertPolicies_servers_gabo_dev_eshop_sql_name_Default 'Microsoft.Sql/servers/securityAlertPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_servers_gabo_dev_eshop_sql_name_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_resource.name}/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
    storageContainerPath: vulnerabilityAssessments_Default_storageContainerPath
  }
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/Default'
  location: 'West Europe'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/Default'
  location: 'West Europe'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/Default'
  location: 'West Europe'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/Default'
  location: 'West Europe'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/Default'
  location: 'West Europe'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/Default'
  location: 'West Europe'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_Default 'Microsoft.Sql/servers/databases/auditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_Default 'Microsoft.Sql/servers/databases/auditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_Default 'Microsoft.Sql/servers/databases/auditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_Default 'Microsoft.Sql/servers/databases/auditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_Default 'Microsoft.Sql/servers/databases/auditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_Default 'Microsoft.Sql/servers/databases/auditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/default'
  properties: {
    retentionDays: 7
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/default'
  properties: {
    retentionDays: 7
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/default'
  properties: {
    retentionDays: 7
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/default'
  properties: {
    retentionDays: 7
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/default'
  properties: {
    retentionDays: 7
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/default'
  properties: {
    retentionDays: 7
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/Default'
  location: 'West Europe'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/Default'
  location: 'West Europe'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/Default'
  location: 'West Europe'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/Default'
  location: 'West Europe'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/Default'
  location: 'West Europe'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/Default'
  location: 'West Europe'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/current'
  location: 'West Europe'
  properties: {
    status: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/current'
  location: 'West Europe'
  properties: {
    status: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/current'
  location: 'West Europe'
  properties: {
    status: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/current'
  location: 'West Europe'
  properties: {
    status: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/current'
  location: 'West Europe'
  properties: {
    status: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2014-04-01' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/current'
  location: 'West Europe'
  properties: {
    status: 'Enabled'
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_authorization_db.name}/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_basket_db.name}/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_catalog_db.name}/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_orders_db.name}/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_tenant_db.name}/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2020-08-01-preview' = {
  name: '${servers_gabo_dev_eshop_sql_name_gabo_dev_eshop_users_db.name}/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_gabo_dev_eshop_sql_name_resource
  ]
}