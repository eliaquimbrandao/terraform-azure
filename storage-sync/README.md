---
title: Deploy Storage Sync Service (Azure File Sync) Basic Infrastructure.
description: Terraform to deploy File Sync environment and necessary resources for a basic infrastructure in Azure.
keywords: azure devops, terraform, iac, storage sync service, azure file sync and its components.
topic: how-to
review date: 14/10/2024
custom: dev-track-terraform
---

# Storage Sync Services (Azure File Sync)

![Terraform](https://img.shields.io/badge/Terraform-Examples-blueviolet)
![Terraform Version](https://img.shields.io/badge/Terraform-v1.9.7-blueviolet)
![Azure](https://img.shields.io/badge/Azure-IaC-blue)

![Status](https://img.shields.io/badge/Status-Development%20Completed-brightgreen)
![License](https://img.shields.io/badge/License-MIT-yellowgreen)
![Contributions](https://img.shields.io/badge/Contributions-Welcome-brightgreen)

## Overview
This project automates the deployment of an Azure Storage Sync environment using Terraform. It consists of modularized components for resource group creation, storage account and storage sync services and its components.

> [!IMPORTANT]
>
> When creating Azure File Sync cloud endpoints, remember that lower-level mechanisms like ARM templates or SDKs are used. Therefore, configuring the necessary permissions is the author’s responsibility:
> 
> For this use case, the following were utilized:
>
> **Terraform SPN:** `Contributor` and `Storage Account Contributor` and for a more restrictive access level, was created a custom role for `Azure File Sync Administrator`.
>
> **StorageSync Service:** Ensure the `Microsoft.StorageSync` application has `Reader and Data Access` permissions at the subscription level or Storage Account level.

> [!NOTE]
>  Microsoft public article request the identity to have `Owner` [Create cloud endpoint](https://learn.microsoft.com/en-us/azure/storage/file-sync/file-sync-deployment-guide?tabs=azure-portal%2Cproactive-portal#create-a-sync-group-and-a-cloud-endpoint).
> 
> *"The administrator creating the cloud endpoint must be a member of the management role Owner for the storage account that contains the Azure file share the cloud endpoint is pointing to"*


## Project Structure

```
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

## Diagram

```mermaid
graph TD
    subgraph TF["Terraform Workflow"]
        1((az login)) --> 2([terraform init])
        2 --> 3([terraform plan])
        3 --> 4([terraform apply])
    end
    style TF fill:#623CE4,stroke:#333,stroke-width:1px,color:#ffffff

    subgraph AZ["Azure Infrastructure"]
        A{{Resource Group}} --> B((Storage Account))
        B --> F[/File Share/]
        A --> C{{Storage Sync Service}}
        C --> D[(Cloud Endpoint)]
        C --> E[(Server Endpoint)]
        F --> D
    end
    style AZ fill:#007FFF,stroke:#333,stroke-width:1px,color:#ffffff

    TF --- AZ
```
## Steps

