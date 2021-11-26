### Functions app project
#### Create a functions app project
func init log8415-functions-app --dotnet

#### Add new function of type HTTP Trigger
func new --name HttpExample --template "HTTP trigger" --authlevel "anonymous"

### Azure resource configuration
#### Create Resource Group
az group create --location canadaeast --resource-group log8415-resource-group

#### Create storage account
az storage account create --name log8415storage --location canadaeast --resource-group log8415-resource-group

#### Create functions app
az functionapp create --resource-group log8415-resource-group --consumption-plan-location canadaeast --runtime dotnet --name log8415-functions-app --storage-account log8415storage --os-type Windows --functions-version 4

#### Deploy functions app
func azure functionapp publish log8415-functions-app

### Continuous Integration (CI) / Continious Deployment (CD)
- Push project to GitHub repository
- Go to *All Resources* and find your *functions-app*
- Go to *Deployment Center* and connect with your GitHub account (This will create a .yaml deployment file)
- Push changes to *master branch* and it will automatically build/deploy to azure
