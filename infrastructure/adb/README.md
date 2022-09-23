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
4. Create docker endpoint, get id for your endpoint, and update it to enable all pipelines.
    ```
    az devops service-endpoint create --service-endpoint-configuration ./infrastructure/adb/acr_service_conn.json --org $org -p $project
    epId=`az devops service-endpoint list --org $org -p $project --query "[?name=='endpointname'].id" -o tsv` && echo $epId
    az devops service-endpoint update --id $epId --enable-for-all true --org $org -p $project
    ```

### Problems
1. The service connection is required before the run of the pipelines, even if you create it before docker build/push in previous step, it still complains. 
2. Creating service connection for docker registry in the pipeline does not work, it only works in your local.

### Current Solution
Multiple Components of Infrastructure are deployed separately.
1. Resource Manager Service Connection (once)
2. Azure Container Registry (ACR) (once)
3. Docker registry ACR Service Connection (once)
4. Docker build/push (trigger by main)
5. App Service (trigger by main)

### References 
1. [Step by step: Manually Create an Azure DevOps Service Connection to Azure](https://4bes.nl/2019/07/11/step-by-step-manually-create-an-azure-devops-service-connection-to-azure/)
2. [Please provide the JSON examples for --service-endpoint-configuration](https://github.com/Azure/azure-cli-extensions/issues/1495)
3. [Create service endpoint connections to Docker registry & ACR](https://github.com/Azure/azure-devops-cli-extension/issues/706)
4. [Azure Pipelines – Parameters + JSON File Substitution](https://codingwithtaz.blog/2020/09/13/azure-pipelines-parameters-and-file-substitution/)