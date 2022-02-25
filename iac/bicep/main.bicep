// =========== main.bicep ===========
@maxLength(3)
param postfix string = substring(uniqueString(resourceGroup().id), 0, 3)
param location string = resourceGroup().location
param appServiceAppNameREST string = 'rest-web-ipaas-${postfix}'
param appServiceAppNameLogicApp string = 'aggregate-ipaas-${postfix}'
param sqlDBName string = '${postfix}sqldb'
param sqlServerName string = '${postfix}sqlserver'
param sqlAdminUserName string
param sqlAdminUserSid string 
param apimpublisherEmail string
param apimpublisherName string = 'iPaaS Demo Inc.'
param apimName string = 'rest-gateway-ipaas'
//param apimInstanceName string = ''

var logAnalyticsWSname = 'logs-ipaas'
var appInsightsName = 'insights-ipaas'

module logging 'modules/logging.bicep' = {
  name: 'monitorDeployment'
  params: {
    location: location
    logAnalyticsWSname: logAnalyticsWSname
    appInsightsName: appInsightsName
  }
}

module compute 'modules/compute.bicep' = {
  name: 'computeDeployment'
  params: {
    location: location
    appServiceAppNameREST: appServiceAppNameREST
    appServiceAppNameLogicApp: appServiceAppNameLogicApp
    APPINSIGHTS_INSTRUMENTATIONKEY: logging.outputs.APPINSIGHTS_INSTRUMENTATIONKEY
  }
}

module apim 'modules/apim.bicep' = {
  name: 'apimDeployment'
  params: {
    location: location
    apimName: apimName
    apimpublisherEmail: apimpublisherEmail
    apimpublisherName: apimpublisherName
  }
}


module sql 'modules/sql.bicep' = {
  name: 'sqlDeployment'
  params: {
    location: location
    sqlDBName: sqlDBName
    sqlServerName: sqlServerName
    sqlAdminUserName: sqlAdminUserName
    sqlAdminUserSid: sqlAdminUserSid
    miName: 'rest-ipaas-mi'
  }
}


