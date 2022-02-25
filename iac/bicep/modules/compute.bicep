param location string
param APPINSIGHTS_INSTRUMENTATIONKEY string = ''

param appServicePlanRESTname string = 'AppServicePlan-REST-iPaaS'
param appServicePlanRESTSkuName string = 'F1'
param appServiceAppNameREST string

param appServiceAppNameLogicApp string

param productPriceLogicAppDefinition object = json(loadTextContent('Product-Price-Workflow.json'))

resource appServicePlanREST 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: appServicePlanRESTname
  location: location
  kind: 'linux'
  properties: {
    reserved: true
  }
  sku: {
    name: appServicePlanRESTSkuName
  }
}

resource appServiceAppREST 'Microsoft.Web/sites@2021-02-01' = {
  name: appServiceAppNameREST
  location: location
  properties: {
    serverFarmId: appServicePlanREST.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'DOTNETCORE|6.0'
    }
  }
}

resource appServiceAppSettingsREST 'Microsoft.Web/sites/config@2021-03-01' = {
  parent: appServiceAppREST
  name: 'appsettings'
  properties: {
    APPINSIGHTS_INSTRUMENTATIONKEY: APPINSIGHTS_INSTRUMENTATIONKEY
  }
}

resource productPriceLogicApp 'Microsoft.Logic/workflows@2019-05-01' = {
  name: appServiceAppNameLogicApp
  location: location
  properties: {
    definition: productPriceLogicAppDefinition.definition
  }
}

