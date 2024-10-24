
# Storage Sync Services (Azure File Sync)

![Terraform](https://img.shields.io/badge/Terraform-Examples-blueviolet)
![Terraform Version](https://img.shields.io/badge/Terraform-v1.9.7-blueviolet)
![Azure](https://img.shields.io/badge/Azure-IaC-blue)

![Status](https://img.shields.io/badge/Status-Development%20Completed-brightgreen)
![License](https://img.shields.io/badge/License-MIT-yellowgreen)
![Contributions](https://img.shields.io/badge/Contributions-Welcome-brightgreen)

## In this article

- [Overview](#overview)
- [Prerequisites](#prerequisites)
  - [Access](#access)
- [Architecture Overview](#architecture-overview)
- [Project Structure](#project-structure)
  - [Terraform Files Structure](#terraform-files-structure)
- [How To](#how-to)
  - [Part 1: Provisioning Core Azure Resources](#part-1-provisioning-core-azure-resources)
  - [Part 2: Server Endpoint configuration](#part-2-server-endpoint-configuration)
    - [Part 2.1: Installing the Azure File Sync Agent](#part-21-installing-the-azure-file-sync-agent)
    - [Part 2.2: Registering the Server and Collecting the Server ID](#part-22-registering-the-server-and-collecting-the-server-id)
    - [Part 2.3: Applying the Server-Endpoint Module](#part-23-applying-the-server-endpoint-module)

## Overview
This project automates the deployment of an Azure Storage Sync environment using Terraform. It consists of modularized components for resource group creation, storage account and storage sync services and its components.

## Prerequisites

> [!NOTE]
>  To create a cloud endpoint for Azure File Sync, the Microsoft documentation specifies that the credential identity must have the `Owner` permission. [Create cloud endpoint](https://learn.microsoft.com/en-us/azure/storage/file-sync/file-sync-deployment-guide?tabs=azure-portal%2Cproactive-portal#create-a-sync-group-and-a-cloud-endpoint).
> 
> *"The administrator creating the cloud endpoint must be a member of the management role `Owner` for the storage account that contains the Azure file share the cloud endpoint is pointing to"*.
> 
> Creating a cloud endpoint involves lower-level operations that go beyond standard data access permissions. These operations often involve configurations and permissions associated with the Azure Resource Manager (ARM) templates or SDKs. As a result, it is the responsibility of the user to ensure the necessary permissions are in place.


### Access 
As mentioned before [terraform-azure](../README.md), after you have setup your environment and configured **Service Principal** credentials, ensure that it has the appropriate permissions for provisioning the required resources.

  -  **Azure Service Principal:** `Contributor` access at subscription level. Consider a custom RBAC (Role-Based Access Control) for more restrictive access level if required.

  -  **StorageSync Service:** Ensure the `Microsoft.StorageSync` application has `Reader and Data Access` permissions at the Storage Account level or subscription level to enable required low-level operations. [terraform-note](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_sync_cloud_endpoint)
   
 
```bash
appId=$(az ad sp list --display-name "Microsoft.StorageSync" --query "[0].appId" -o tsv)

az role assignment create --assignee $appId --role "Reader and Data Access" --scope "/subscriptions/your-subscription-id"
```

## 
> [!IMPORTANT]
> When using the `Owner` permission via the Azure portal, access to the `Microsoft.StorageSync` application is configured automatically to the Storage account, providing a smoother experience. However, using lower level mechanisms, even with `Owner` does not currently yield the same results. An issue is open to address this discrepancy.
> 
> [issue #9531](https://github.com/Azure/azure-powershell/issues/9531)
> 
> [issue #28614](https://github.com/Azure/azure-cli/issues/28614)

## Architecture Overview
This diagram illustrates the deployment flow, starting from Azure authentication, progressing through Terraform actions, and in the creation of resources within the Azure infrastructure.

<img width="920" alt="image" src="https://github.com/user-attachments/assets/0574cff2-7900-4efd-bd35-e82855f42ea2">

> [!IMPORTANT]
> The project is structured as described, but it may undergo changes in the future to adopt a more automated approach.

## Project Structure

For this project, we will structure it into two parts:

- Part 1: 
  - Storage Account
  - File share
  - Storage Sync Service
  - Cloud endpoint
   
- Part 2:
  - Installation of the agent on server and server registration.
    - [Install the Azure File Sync agent](https://learn.microsoft.com/en-us/azure/storage/file-sync/file-sync-deployment-guide?tabs=azure-portal%2Cproactive-portal#install-the-azure-file-sync-agent)
  - Configuration of the server endpoint within the Storage Sync Service.

### Terraform files Structure
```hcl
storage-sync/
├── module-rg
│   ├── rg.tf
│   ├── outputs.tf
│   └── variables.tf
├── module-storage
│   ├── basicstorage.tf
│   ├── outputs.tf
│   └── variables.tf
├── module-storage-sync-service
│   ├── storagesync.tf
│   ├── cloudendpoint.tf
│   ├── outputs.tf
│   └── variables.tf
├── module-server-endpoint
│   ├── serverendpoint.tf
│   ├── outputs.tf
│   └── variables.tf
├── main.tf
├── providers.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── README.md
```

- **module-rg**: Creates the resource group for all resources.
  - `rg.tf`: Defines the resource group.

- **module-storage**: Manages the storage account.
  - `basicstorage.tf`: Configures the storage account with necessary settings.

- **module-storage-sync-service**: Configures the storage sync service.
  - `storagesync.tf`: Sets up the storage sync service.
  - `cloudendpoint.tf`: Configures the cloud endpoint for syncing.

- **module-server-endpoint**: Sets up the server endpoint.
  - `serverendpoint.tf`: Configures the server endpoint details.

- **Root Directory Files (storage-sync)**:
  - `main.tf`: Orchestrates module deployments.
  - `providers.tf`: Specifies provider configurations.
  - `terraform.tfvars`: Holds variable values for the project.
  - `variables.tf`: Contains global variables for project configuration.
  - `README.md`: Project documentation.

> [!NOTE]
> 
> The project is structured this way because we will need to manually intervene to install the agent on the server where the file server we want to synchronize is located. After this correct instalation and server registration, we will obtain the value for the `registered_server_id` variable, which will allow us to proceed with applying the `module-server-endpoint`.

## How to

> [!TIP]
> If you are not currently in the project folder, you can still initialize Terraform for the project by specifying the folder path directly. Use the following command:
>
> ```hcl
> terraform -chdir=path/to/your/project init
> ```
>
> This allows you to initialize Terraform without needing to change directories.

### Part 1: Provisioning Core Azure Resources

In the first phase of this project, we begin with `terraform init`, followed by `terraform plan` to confirm that the configuration aligns with expectations. After verification, we run `terraform apply` to implement the changes. This phase targets the `rg, storage, and syncservice modules`, ensuring that core Azure infrastructure components are correctly set up and ready for the next stages.

```hcl
terraform init
```
<img width="728" alt="image" src="https://github.com/user-attachments/assets/01ab33d1-1ee1-4a36-a1ab-68785389ca81">

```hcl
terraform plan -target=module.rg -target=module.storage -target=module.syncservice
```
<img width="1168" alt="image" src="https://github.com/user-attachments/assets/36ab301a-4052-46f7-8a2c-c6d48e3d3d57">

```hcl
terraform apply -target=module.rg -target=module.storage -target=module.syncservice
```
<img width="1170" alt="image" src="https://github.com/user-attachments/assets/2a5b4654-1f0c-41fb-9534-42613e8194a2">
<img width="557" alt="image" src="https://github.com/user-attachments/assets/e08dc459-ca1e-4dd2-b9bb-af925d616988">

### Part 2: Server Endpoint configuration

In the second phase, we focus on setting up the server endpoint components for Storage Sync Service by installing the [Azure File Sync Agent](#part-21-installing-the-azure-file-sync-agent), [registering](#part-22-registering-the-server-and-collecting-the-server-id) the server with the Azure Storage Sync Service, [collecting](#part-22-registering-the-server-and-collecting-the-server-id) the registered Server ID, and updating the `terraform.tfvars` file with the Server ID, ensuring the server is ready for file sync operations and fully integrated into the Azure infrastructure to [apply](#part-23-applying-the-server-endpoint-module) `terraform apply` the `module-server-endpoint`.

#### Part 2.1: Installing the Azure File Sync Agent

1. **Download the Azure File Sync Agent:**
   - Head over to the [Microsoft Azure Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=57159).
   - Download the latest version of the **Azure File Sync Agent** for your server's operating system.

2. **Install the Sync Agent:**
   - Run the installer on your server and follow the on-screen prompts to complete the installation.

3. **Verify the Installation:**
   - Once installed the **Azure File Sync Agent**, you will be automatically prompted to register the server. If the prompt does not appear, manually open the File Sync Agent and proceed with the server registration.
  
#### Part 2.2: Registering the Server and Collecting the Server ID

1. **Register the Server:**
   - In the **Azure File Sync Agent**, click on **Register Server**.
   - Sign in using your Azure credentials and choose the appropriate **Azure subscription** and **Resource Group** where your Azure Storage Sync Service is located.
   - Select your **Storage Sync Service** to complete the server registration.

<img width="629" alt="image" src="https://github.com/user-attachments/assets/bdd1415b-cb58-4ade-901f-f9f64b2e69c4">

This completes the installation of the Azure File Sync Agent and the server registration with the Storage Sync Service.

<img width="1499" alt="image" src="https://github.com/user-attachments/assets/60ab8bc0-56f0-45e0-8f75-02c56cac691a">

> [!TIP]
> You can copy the Azure resource URL, which will already include the server ID; however, in the next step, we will collect it.
>
> <img width="624" alt="image" src="https://github.com/user-attachments/assets/58b8608e-4803-4362-9ccb-83c5c6b138a3">

2. **Collect the Registered Server ID:**
  - Use the following CLI command to collect the Registered Server ID from the Azure Storage Sync Service.
    
```bash
az storagesync registered-server list --resource-group <rg-name> --storage-sync-service <storage-sync-name> --query "[].id" --output tsv
```

**Example Output**:

```bash
/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/<rg-name>/providers/Microsoft.StorageSync/storageSyncServices/<storage-sync-name>/registeredServers/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

3. **Update the `terraform.tfvars` File:**
   - Open the `terraform.tfvars` file in your repository.
   - Add the server's **ID** that you copied or collect earlier to the corresponding variable for the module-server-endpoint.

```hcl
registered_server_id = "<your-registered-server-id>"
```

#### Part 2.3: Applying the Server-Endpoint Module

In this step, we will `plan` and `apply` the server-endpoint module to configure the server’s connection to Azure File Sync. This completes the process of setting up the server endpoint, linking your server to the Azure File Sync service for synchronization.

```hcl
terraform plan -target=module.server-endpoint

terraform apply -target=module.server-endpoint
```

<img width="1185" alt="image" src="https://github.com/user-attachments/assets/0aeba9aa-a9f5-4e42-a064-813574ca7665">

<img width="1179" alt="image" src="https://github.com/user-attachments/assets/06dfbcc1-0aae-4b75-b0c3-43739d3d568a">

After applying the server endpoint module, verify your Sync Group to ensure the server endpoint is properly configured. The synchronization "Initial Sync" process will begin, and completion will depend on the volume of data being synchronized.

<img width="1500" alt="image" src="https://github.com/user-attachments/assets/1b88e3b0-b21d-4aa7-a0d2-b9b5296d33af">
