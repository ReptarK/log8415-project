### Create a functions app project
func init log8415-functions-app --dotnet

### Add new function of type HTTP Trigger
func new --name HttpExample --template "HTTP trigger" --authlevel "anonymous"

## Azure resource configuration
### Create Resource Group
az group create --location canadaeast --resource-group log8415-resource-group

### Create storage account
az storage account create --name log8415storage --location canadaeast --resource-group log8415-resource-group

### Create functions app
az functionapp create --resource-group log8415-resource-group --consumption-plan-location canadaeast --runtime dotnet --name log8415-functions-app --storage-account log8415storage --os-type Windows

### Deploy functions app
func azure functionapp publish log8415-functions-app