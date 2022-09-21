@minLength(5)
@maxLength(50)
@description('Provide a globally unique name of your Azure Container Registry')
param acrName string

@description('Provide a location for the registry.')
param location string = resourceGroup().location

@description('Provide a tier of your Azure Container Registry.')
param acrSku string = 'Basic'

@description('Whether new or existing container registry')
@allowed(['new', 'existing'])
param acrNewOrExisiting string = 'new'

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
