### Steps
1. Create your service principal. 
    ```
    subscriptionId=`az account subscription list --query '[0].subscriptionId' -o tsv`
    spName=ownerName
    role=owner # must
    rg=exampleRG
    az ad sp create-for-rbac --name ${spName} --role ${role} --scopes /subscriptions/${subscriptionId}/resourceGroups/${rg}
    az ad sp create-for-rbac --name ${spName} --role ${role} --scopes /subscriptions/${subscriptionId}/resourceGroups/${rg} --sdk-auth
    ```
2. In your project, go to project settings (left bottom), service connections and new service connection. Then azure resource manager, service principal (manual).
    ```
    Environment: Azure Cloud
    Scope level: Subscription
    Subscription Id: $(subscriptionId)
    Subscription Name: Pay-As-You-Go
    Service Principal Id: client id (from --sdk-auth)
    Credential: Service principal key: service principal key
    Service principal key: password (from X--sdk-auth)
    Tenant ID: tenant id (--sdk-auth)
    Service connection name: (whatever you need to reuse)
    ```
    - Variables + Azure CLI
        ```
        subscriptionName=Pay-As-You-Go
        subscriptionId=`az account subscription list --query '[0].subscriptionId' -o tsv`
        spId=`az ad sp create-for-rbac --name ${spName} --role ${role} --scopes /subscriptions/${subscriptionId}/resourceGroups/${rg} --query appId -o tsv`
        tId=`az ad sp create-for-rbac --name ${spName} --role ${role} --scopes /subscriptions/${subscriptionId}/resourceGroups/${rg} --query tenant -o tsv`
        spkey=`az ad sp create-for-rbac --name leoApp --role owner --scopes /subscriptions/${subscriptionId}/resourceGroups/leo-ml-test --query password -o tsv`
        export AZURE_DEVOPS_EXT_AZURE_RM_SERVICE_PRINCIPAL_KEY=${spkey}
        org=https://dev.azure.com/leoleung0900
        project=webpack-react-ts-mpa-example
        az devops service-endpoint azurerm create --azure-rm-service-principal-id ${spId} --azure-rm-subscription-id ${subscriptionId} --azure-rm-subscription-name ${subscriptionName} --azure-rm-tenant-id ${tId} --name leo-cli-rm --org ${org} --p ${project}
        ```
3. In Project settings, permissions, endpoint creators, add your project to members. 

### References 
1. [Step by step: Manually Create an Azure DevOps Service Connection to Azure](https://4bes.nl/2019/07/11/step-by-step-manually-create-an-azure-devops-service-connection-to-azure/)