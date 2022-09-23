param acrName string
param webAppName string
param location string = resourceGroup().location
param dockerImage string = 'bicep-app-service-container:latest'
param hookName string = 'webhook1'

resource acrResource 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' existing = {
  name: acrName
}

resource publishingcreds 'Microsoft.Web/sites/config@2021-01-01' existing = {
  name: '${webAppName}/publishingcredentials'
}

var creds = list(publishingcreds.id, publishingcreds.apiVersion).properties.scmUri


resource hook 'Microsoft.ContainerRegistry/registries/webhooks@2020-11-01-preview' = {
  parent: acrResource
  location: location
  name: hookName
  properties: {
    serviceUri: '${creds}/api/registry/webhook'
    status: 'enabled'
    scope: dockerImage
    actions: [
      'push'
    ]
  }
}
