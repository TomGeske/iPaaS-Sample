param logAnalyticsWSname string
param appInsightsName string
param location string

resource logAnalytics_ws 'Microsoft.OperationalInsights/workspaces@2021-12-01-preview' = {
  name: logAnalyticsWSname
  location: location
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  kind: 'web'
  location: location
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics_ws.id
  }
}

output APPINSIGHTS_INSTRUMENTATIONKEY string = appInsights.properties.InstrumentationKey
