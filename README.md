# LOG8415 Personal Project

## Complete CI/CD setup on Azure to deploy serverless functions

### Goal
Developers can leverage Azure Functions to build HTTP-based API endpoints that are accessible by a wide range of applications.
With the CI/CD integration, it is easier than ever to develop and deploy the code on the cloud.

In this project, we will ...
- Create an Azure **Functions App**
- Setup **Continuous Integration** (CI) with *Azure Build Pipeline*
- Configure **Continuous Deployment** (CD) with *Azure Release Pipelines*

### Work with the code
- Clone the repository
- Add/Edit functions 
- Push changes to *master* branch and it will automatically deploy to azure cloud serverless functions

### Compile & Run
To test the functions app locally, simply run this command in the console
> func start

This will create an API to call the functions: localhost:PORT/api/FUNCTION_1


## How to create a project from scratch
### Functions app project
#### Create a functions app project
> func init APP_NAME --dotnet

#### Add new function of type HTTP Trigger
> func new --name FUNCTION_NAME --template "HTTP trigger" --authlevel "anonymous"

### Azure resource configuration
#### Create Resource Group
> az group create --location canadaeast --resource-group RESOURCE_GROUP_NAME

#### Create storage account
> az storage account create --name STORAGE_NAME --location canadaeast --resource-group RESOURCE_GROUP_NAME

#### Create functions app
> az functionapp create --resource-group RESOURCE_GROUP_NAME --consumption-plan-location canadaeast --runtime dotnet --name APP_NAME --storage-account STORAGE_NAME --os-type Windows --functions-version 4

#### Deploy functions app
> func azure functionapp publish APP_NAME

### Continuous Integration (CI) / Continious Deployment (CD)
- Push project to GitHub repository
- Go to *All Resources* and find your *functions-app*
- Go to *Deployment Center* and connect with your GitHub account (This will create a .yaml deployment file)
- Push changes to *master branch* and it will automatically build/deploy to azure


