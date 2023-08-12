@description('Application Short Name')
param app string

@description('Environment')
param env string

@description('Location Short Name')
param locationShortName string

@description('Location')
param location string = resourceGroup().location

module learnWebApp 'modules/webApp.bicep' = {
  name: '${deployment().name}-tmplWebAppDeploy'
  params: {
    app: app
    env: env
    locationShortName: locationShortName
    location: location
  }
}
