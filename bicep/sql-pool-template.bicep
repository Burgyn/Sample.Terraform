param servers_gabo_test_sql_name string = 'gabo-test-sql'

resource servers_gabo_test_sql_name_resource 'Microsoft.Sql/servers@2020-08-01-preview' = {
  name: servers_gabo_test_sql_name
  location: 'westeurope'
  properties: {
    administratorLogin: 'gabo'
    version: '12.0'
    publicNetworkAccess: 'Enabled'
  }
}

resource servers_gabo_test_sql_name_gbo_elasticpool 'Microsoft.Sql/servers/elasticPools@2020-08-01-preview' = {
  name: '${servers_gabo_test_sql_name_resource.name}/gbo-elasticpool'
  location: 'westeurope'
  sku: {
    name: 'StandardPool'
    tier: 'Standard'
    capacity: 100
  }
  properties: {
    maxSizeBytes: 107374182400
    perDatabaseSettings: {
      minCapacity: 0
      maxCapacity: 10
    }
    zoneRedundant: false
    maintenanceConfigurationId: '/subscriptions/e321f168-8250-4ebb-b970-5b9f6a8f1847/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
  }
}

resource servers_gabo_test_sql_name_test_db 'Microsoft.Sql/servers/databases@2020-08-01-preview' = {
  name: '${servers_gabo_test_sql_name_resource.name}/test-db'
  location: 'westeurope'
  sku: {
    name: 'ElasticPool'
    tier: 'Standard'
    capacity: 0
  }
  properties: {
    collation: 'Slovak_CI_AI'
    maxSizeBytes: 268435456000
    elasticPoolId: servers_gabo_test_sql_name_gbo_elasticpool.id
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    storageAccountType: 'GRS'
    maintenanceConfigurationId: '/subscriptions/e321f168-8250-4ebb-b970-5b9f6a8f1847/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
  }
}
