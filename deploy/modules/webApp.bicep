@description('Application Short Name')
param app string

@description('Environment')
param env string

@description('Location Short Name')
param locationShortName string

@description('Location')
param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: 'asp-${app}-${env}-${locationShortName}'
  location: location
  sku: {
    tier: 'Basic'
    name: 'B1'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource appService 'Microsoft.Web/sites@2022-09-01' = {
  name: 'app-${app}-${env}-${locationShortName}'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'DOTNETCORE|6.0'
      alwaysOn: true
      ftpsState: 'Disabled'
    }
  }
}
