// =========== sql.bicep ===========
param sqlServerName string
param sqlAdminUserName string
param sqlAdminUserSid string
param sqlDBName string
param miName string
param location string

resource sql_server 'Microsoft.Sql/servers@2021-08-01-preview' = {
  location: location
  name: sqlServerName
  properties: {
    publicNetworkAccess: 'Enabled'
    minimalTlsVersion: '1.2'
    administrators: {
      administratorType: 'ActiveDirectory'
      azureADOnlyAuthentication: true
      login: sqlAdminUserName
      sid: sqlAdminUserSid
      principalType: 'User'
    }
  }
}

resource sql_server_firewall 'Microsoft.Sql/servers/firewallRules@2021-08-01-preview' = {
  name: 'AllowAllWindowsAzureIps'
  parent: sql_server
  properties: {
    endIpAddress: '0.0.0.0'
    startIpAddress: '0.0.0.0'
  }
}

resource sqldb 'Microsoft.Sql/servers/databases@2021-08-01-preview' = {
  parent: sql_server
  name: sqlDBName
  location: location
  sku: {
    name: 'GP_S_Gen5'
    capacity: 1
  }
  properties: {
    autoPauseDelay: 60
  }
}

resource rest_mi 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' = {
  location: location
  name: miName
}

output rest_mi_clientId string = rest_mi.properties.clientId
output rest_mi_principalId string = rest_mi.properties.principalId
