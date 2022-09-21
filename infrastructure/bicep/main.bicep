@maxLength(50)
@description('Provide a globally unique name of your Azure Container Registry')
param acrName string = ''

@maxLength(50)
@description('Provide a globally unique name of your Azure App Service')
param webAppName string = ''

param dockerRegistryHost string = 'acrleotest97.azurecr.io'
param dockerImage string = 'bicep-app-service-container:latest'

@description('Provide a location for the registry.')
param location string = resourceGroup().location

@description('Provide a tier of your Azure Container Registry.')
param acrSku string = 'Basic'

@description('Whether new or existing container registry')
@allowed(['new', 'existing'])
param acrNewOrExisiting string = 'new'

@description('Whether new or existing app service')
@allowed(['new', 'existing'])
param apsNewOrExisiting string = 'new'

param createdBy string = 'Leo Leung'
param projectName string = 'Learn Azure'
param dateTime string = utcNow()

module acrModule './modules/acr.bicep' = if (acrNewOrExisiting == 'new') {
  name: 'acrDeploy'
  params: {
    acrName: acrName
    location: location
    acrSku: acrSku
    createdBy: createdBy
    projectName: projectName
    dateTime: dateTime
  }
}

module appserviceModule './modules/app_service.bicep' = if (apsNewOrExisiting == 'new') {
  name: 'apsDeploy'
  params: {
    webAppName: webAppName
    location: location
    dockerImage: dockerImage
    dockerRegistryHost: dockerRegistryHost
    createdBy: createdBy
    projectName: projectName
    dateTime: dateTime
  }
}

