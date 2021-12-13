:: The application name
set APP_NAME="log8415-functions-app"

:: The http trigger function name
set FUNCTION_NAME="HttpTriggerExample"

:: The resource group name on Azure
set RESOURCE_GROUP_NAME="log8415-resource-group"

:: The storage name on Azure
set STORAGE_NAME="log8415storage"


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

mkdir %APP_NAME%
cd %APP_NAME%

:: Create a functions app project
func init %APP_NAME% --dotnet

:: Add new function of type HTTP Trigger
func new --name %FUNCTION_NAME% --template "HTTP trigger" --authlevel "anonymous"

:: Azure resource configuration
call az login

:: Create Resource Group
call az group create --location canadaeast --resource-group %RESOURCE_GROUP_NAME%

:: Create storage account
call az storage account create --name %STORAGE_NAME% --location canadaeast --resource-group %RESOURCE_GROUP_NAME%

:: Create functions application
call az functionapp create --resource-group %RESOURCE_GROUP_NAME% --consumption-plan-location canadaeast --runtime dotnet --name %APP_NAME% --storage-account %STORAGE_NAME% --os-type Windows --functions-version 4