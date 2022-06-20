# Field Engineer Web API

This repo stores the code for a simple Web API that presents information helpful to heating engineers working in the field to maintain and fix furnaces in domestic settings. This API supports the document **The fusion development approach to building power apps**. In the document, the development of Power Apps, which integrates with this Web API, is described.

This repo also includes the JSON definition for the Logic App created in the document.

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.

## Prerequisites

You will need the following software on your computer:

- PowerShell
- .NET 6.0
- A Git client
- Visual Studio Code together with the following extensions:
    - The C# extension, available at https://aka.ms/AAbvu72.  
    - The Azure App Service extension, available at https://aka.ms/AAbvgm8. 
    - The Azure Account extension, available at https://aka.ms/AAbvgm7.  
    - The The SQL Server extension, available at https://aka.ms/AAbvgm5.  


You'll also need an Azure subscription and a PowerApps subscription.

## Clone the sample code on your local computer

To view and edit the code in this project, use `git` to clone this project on your hard drive:

1. Start PowerShell and navigate to a directory where you want to keep the source code.
1. To clone the source code, enter this command:

    ```powershell
    git clone https://github.com/microsoft/fusion-dev-ebook
    cd fusion-dev-ebook
    ```

## Set up an Azure SQL Database server

The Web API requires three SQL databases:

- InventoryDB. This database stores information about boiler parts and their stock numbers.
- KnowledgeBaseDB. This database stores technical tips on each boiler part.
- ScheduleDB. This database stores appointment details.

You can set up these databases in Azure SQL Database by following these steps:

1. Long into the [Azure Portal](https://portal.azure.com) with your usual credentials.
1. Start the **Cloud Shell** and select the **PowerShell** environment.
1. To clone the source code in the Cloud Shell, enter these commands:

    ```powershell
    git clone https://github.com/microsoft/fusion-dev-ebook
    cd fusion-dev-ebook
    ```

1. To create an Azure SQL Database server, run this command. When prompted, enter a resource group name (this resource group will be created), SQL server name, and an Azure location, such as **westus**:

    ```powershell
    .\databasesetup.ps1
    ```

1. In the Azure Portal, and navigate to **All resources**. Select the SQL Server you created in the previous step.
1. Under **Security** select, **Firewalls and virtual networks**.
1. Select **Add client IP**.
1. Under **Allow Azure services and resources to access this server**, select **Yes**, and then select **Save**.
1. In the Cloud Shell, to create the databases, run these commands, substituting `<yourservername>` with the name of the SQL Server you just created:

    ```powershell
    sqlcmd -S <yourservername>.database.windows.net -U sqladmin -P Pa55w.rd -i "./SQLScripts/CreateAllDBs.sql"
    sqlcmd -S <yourservername>.database.windows.net -U sqladmin -P Pa55w.rd -d InventoryDB -i "./SQLScripts/InventoryDB-setup.sql"
    sqlcmd -S <yourservername>.database.windows.net -U sqladmin -P Pa55w.rd -d KnowledgeDB -i "./SQLScripts/KnowledgeDB-setup.sql"
    sqlcmd -S <yourservername>.database.windows.net -U sqladmin -P Pa55w.rd -d SchedulesDB -i "./SQLScripts/SchedulesDB-setup.sql"
    ```

## Configure the Web API

You can either follow the steps in the guide to build the Web API, or you can use the completed version provided in this repository. To build and deploy the completed version, perform the following instructions:

1. In your local **PowerShell** instance, start Visual Studio Code in the WebAPI folder:

    ```powershell
    cd WebAPI
    code .
    ```

1. Open **appsettings.json**. There are three connections strings in the file. In each connection string, replace **fieldengineersqlserver** with the name of the SQL server you created above. Replace the password in each connection string with **Pa55w.rd**
1. Open **appsettings.Development.json**. In each connection string, replace **fieldengineersqlserver** with the name of the SQL server you created above, and provide the password **Pa55w.rd**.

### Deploy the Web API in the Azure App Service

1. In Visual Studio Code, press **CTRL + SHIFT + P**, type **Azure: Sign-In** and then press **Enter**.
1. In the browser window, sign into Azure with your usual credentials, and then close the browser window.
1. To open the Azure Tools, in Visual Studio Code press **CTRL + SHIFT + A** and then select the **APP SERVICE** window.
1. Right-click your subscription, and then select **Create New Web app**.
1. Enter a name for the Web app and then press **Enter**.
1. Select the **.NET 6** runtime stack and then select the **Free** pricing tier. Azure creates the new Web app.
1. Right-click the new Web app, and then select **Deploy to Web App**.
1. In the Visual Studio Code dialog, select **Deploy**. Visual Studio Code deploys the Web API to Azure.

### Example API calls

You can examine and experiment with the Field Engineer Web API by using the Swagger user interface:

**http://&lt;yourwebapp&gt;.azurewebsites.net/swagger**

To issue requests to the Web API, you can use the **curl** tool.

To return a list of all parts that field engineers can use, use this command:

```powershell
curl -X GET "https://<yourwebapp>.azurewebsites.net/api/boilerparts" -H "accept: text/plain"
```

To return a list of all appointments for all engineers, use:

```powershell
curl -X GET "https://<yourwebapp>.azurewebsites.net/api/appointments" -H "accept: text/plain"
```

To return a list of all engineers, use:

```powershell
curl -X GET "https://<yourwebapp>.azurewebsites.net/api/scheduleengineer" -H "accept: text/plain"
```

To see a list of all customers and obtain their IDs, use:

```powershell
curl -X GET "https://<yourwebapp>.azurewebsites.net/api/customers" -H "accept: text/plain"
```

To see a list of all the problems and solutions for a given customer, use:

```powershell
curl -X GET "https://<yourwebapp>.azurewebsites.net/api/Customers/<customersid>/Notes" -H  "accept: text/plain"
```

To see a list of all open orders, use:

```powershell
curl -X GET "https://<yourwebapp>.azurewebsites.net/api/Orders/Open" -H  "accept: text/plain"
```

## Notes about the app and the Azure Logic App

The app is available as an exported Zip package in the PowerApp folder. You can import the app from the **Apps** screen at https://make.powerapps.com; select the **Import canvas app** command in the toolbar.

The app does not include the custom connectors for the various data sources. This is because you must create them to connect to your implementation of the services (Azure API Management, Azure Search, and Azure Logic Apps) that provide the data. Follow the instructions in the guide to create these connectors and configure the app.

A complete version of the Logic App is available as a JSON file in the LogicApp folder. You can paste the contents of this file into the **Logic app code view** for a blank Logic App. Change the references to **vanarsdelapim** to your own APIM account.
