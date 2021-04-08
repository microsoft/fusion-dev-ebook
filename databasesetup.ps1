Write-Host "Please enter the following values:"

$resourceGroup = Read-Host -Prompt "Resource Group"
$serverName = Read-Host -Prompt "Server Name"
$location = Read-Host -Prompt "Location"

$login="sqladmin"
$password="Pa55w.rd"

Write-Host "Creating resource group..."

az group create --name $resourceGroup --location $location

Write-Host "Creating SQL Database server..."

az sql server create --name $serverName --resource-group $resourceGroup --location $location --admin-user $login --admin-password $password