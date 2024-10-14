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
This project automates the deployment of an Azure Storage Sync environment using Terraform. It consists of modularized components for resource group creation, storage account setup and storage sync services.

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
    A[Resource Group] --> B[Storage Account]
    A --> C[Storage Sync Service]
    C --> D[Cloud Endpoint]
    C --> E[Server Endpoint]
```
## Steps
