```
az group create -n exampleRG -l eastus
subscriptionId=`az account subscription list --query '[0].subscriptionId' -o tsv`
az ad sp create-for-rbac --name myApp --role contributor --scopes /subscriptions/${subscriptionId}/resourceGroups/exampleRG --sdk-auth # don't use this, you need to be owner
az ad sp create-for-rbac --name myApp --role owner --scopes /subscriptions/${subscriptionId}/resourceGroups/exampleRG --sdk-auth
az group delete --name exampleRG
```