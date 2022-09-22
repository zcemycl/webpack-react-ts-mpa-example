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

### References 
1. [Step by step: Manually Create an Azure DevOps Service Connection to Azure](https://4bes.nl/2019/07/11/step-by-step-manually-create-an-azure-devops-service-connection-to-azure/)