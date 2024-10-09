# Terraform Examples for Azure

![Terraform](https://img.shields.io/badge/Terraform-Examples-blueviolet)
![Terraform Version](https://img.shields.io/badge/Terraform-v1.9.7-blueviolet)
![Azure](https://img.shields.io/badge/Azure-IaC-blue)

![Status](https://img.shields.io/badge/Status-Active%20Development-orange)
![License](https://img.shields.io/badge/License-MIT-yellowgreen)
![Contributions](https://img.shields.io/badge/Contributions-Welcome-brightgreen)


## Overview

Welcome to the **Terraform Examples for Azure** repository! This collection provides **simple and practical Terraform configurations** for managing and automating Azure infrastructure. Our goal is to make it easy for anyone to get started with Terraform on Azure, whether you're deploying basic resources, setting up pods, or exploring specific Azure services.

By leveraging **Infrastructure as Code (IaC)** with Terraform, these examples ensure **consistency**, **repeatability**, and **scalability** across your Azure deployments. We hope these configurations help you quickly utilize Terraform for efficient and reliable deployments.

## Table of Contents

- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Examples](#examples)
- [Collaboration & Contribution](#collaboration--contribution)
- [Goals](#goals)
- [Contact](#contact)
- [License](#license)

## Technologies Used

- **[Terraform Core](https://www.terraform.io/)**: Define and provision infrastructure as code.
- **[Azure Provider (`azurerm`)](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)**: Interact with Azure services using Terraform.
- **[Azure APIs](https://learn.microsoft.com/en-us/rest/api/?view=Azure)**: RESTful APIs for communication between Terraform and Azure.

- **Authentication Methods**:
  - **[Azure CLI](https://learn.microsoft.com/cli/azure/)**: Facilitate authentication and access management within Azure.
  - **[Service Principals](https://learn.microsoft.com/azure/active-directory/develop/app-objects-and-service-principals)**: Secure identities for authenticating with Azure.
  - **[Managed Identities](https://learn.microsoft.com/azure/active-directory/managed-identities-azure-resources/overview)**: Authenticate without managing credentials.

## Getting Started

1. **Clone the Repository**: Copy the repository to your local machine:

   ```bash
   git clone https://github.com/eliaquimbrandao/terraform-azure.git
   ```

2. **Install Terraform**: If you haven't already, [install Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) on your machine.

3. **Authenticate with Azure**:

   - Log in using Azure CLI:

     ```bash
     az login
     ```

   - Or set up a Service Principal:

     ```bash
     az ad sp create-for-rbac --name "terraform-sp" --role="Contributor" --scopes="/subscriptions/<subscription-id>"
     ```

4. **Initialize Terraform**: Navigate to the desired example directory and run:

   ```bash
   terraform init
   ```

5. **Review and Apply Configuration**:

   - Preview the changes:

     ```bash
     terraform plan
     ```

   - Apply the configuration:

     ```bash
     terraform apply
     ```

## Examples

Each example resides in its own directory with specific instructions:

- **Virtual Machine Deployment**: [examples/virtual-machine](examples/virtual-machine)
- **Azure Kubernetes Service (AKS)**: [examples/aks](examples/aks)
- **Storage Account Setup**: [examples/storage-account](examples/storage-account)
- **Networking**: [examples/networking](examples/networking)

*(More examples as they become available.)*

## Collaboration & Contribution

We believe in the power of community! This project is a collaborative effort, and **your ideas and contributions are highly encouraged**. Whether you're a Terraform expert or new to IaC, your input helps make these configurations more versatile and useful for everyone.

- **Found an issue?** Feel free to [open an issue](https://github.com/eliaquimbrandao/terraform-azure/issues).
- **Have a feature request or improvement?** Let's discuss it!
- **Want to contribute?** You're welcome to submit a pull request.

Let's work together to simplify Azure resource management and create reusable, maintainable infrastructure code with Terraform.

## Goals

Our goal is to support the community in unlocking the full potential of Azure through Terraform. We aim to:

- Provide clear and concise examples for common Azure scenarios.
- Make Terraform configurations accessible and easy to understand.
- Encourage learning and sharing of best practices within the community.

## Contact

For any questions or suggestions, feel free to reach out:

- **LinkedIn**: [Eliaquim Brandão](https://www.linkedin.com/in/eliaquim/)
- **GitHub**: [Eliaquim Brandão](https://github.com/eliaquimbrandao)

## License

Made with ❤️ by [Eliaquim Brandão](https://github.com/eliaquimbrandao)

This project is licensed under the [MIT License](LICENSE).
