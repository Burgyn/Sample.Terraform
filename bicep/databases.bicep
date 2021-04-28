@minLength(1)
@maxLength(6)
param prefix string

@minLength(1)
@maxLength(15)
param deploymentEnvironment string

@minLength(1)
param administratorLogin string = 'superadmin'

@minLength(12)
param administratorLoginPassword string

param keyVaultName string

param elasticPoolSettings object

param databases array = []

param location string = resourceGroup().location

resource sqlServer 'Microsoft.Sql/servers@2020-08-01-preview' = {
  name: '${prefix}-${deploymentEnvironment}-eshop-sql'
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    publicNetworkAccess: 'Enabled'
  }
}

resource sqlPool 'Microsoft.Sql/servers/elasticPools@2020-08-01-preview' = {
  name: '${sqlServer.name}/${prefix}-elasticpool'
  location: location
  sku: elasticPoolSettings.sku
  properties: {
    maxSizeBytes: elasticPoolSettings.maxSizeBytes
    perDatabaseSettings: elasticPoolSettings.perDatabaseSettings
    zoneRedundant: false
  }
}

var databaseNames = [for database in databases: '${prefix}-${deploymentEnvironment}-eshop-${toLower(database)}-db']

resource database 'Microsoft.Sql/servers/databases@2020-08-01-preview' = [for databaseName in databaseNames: {
  name: '${sqlServer.name}/${databaseName}'
  location: location
  properties: {
    collation: 'Slovak_CI_AI'
    maxSizeBytes: 250 * 1024 * 1024 * 1024
    zoneRedundant: false
    licenseType: 'BasePrice'
    elasticPoolId: sqlPool.id
  }
}]

resource connectionStrings 'Microsoft.KeyVault/vaults/secrets@2020-04-01-preview' = [for (database, i) in databases: {
  name: '${keyVaultName}/${database}-ConnectionStrings-DefaultConnection-${deploymentEnvironment}'
  properties: {
    value: 'Server=tcp:${sqlServer.name}.database.windows.net,1433;Initial Catalog=${databaseNames[i]};Persist Security Info=False;User ID=${administratorLogin};Password=${administratorLoginPassword};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30'
  }
}]
