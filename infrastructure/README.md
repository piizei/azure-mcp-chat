# Terraform Infrastructure for Azure MCP Chat

This directory contains the Terraform configuration for deploying the Azure MCP Chat application infrastructure using Azure Web Apps.

## Structure

- `provider.tf` - Provider configuration and backend settings
- `variables.tf` - Input variables
- `namep.tf` - Naming convention configuration using the namep provider
- `resources.tf` - Core Azure resources (resource group, app service plan, storage)
- `app_insights.tf` - Application Insights and Log Analytics workspace
- `keyvault.tf` - Azure Key Vault configuration
- `app.tf` - Azure Web App configuration for MCP server
- `outputs.tf` - Output values

## Usage

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Plan the deployment:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

## Variables

- `app_name` - Name of the application (default: "mcpchat")
- `environment` - Environment name (default: "dev")
- `location` - Azure region (default: "eastus")
- `salt` - Optional salt for naming (default: "")

## Features

- Azure Web App (Linux) for hosting the MCP server container
- Uses the official Azure MCP image: `mcr.microsoft.com/azure-sdk/azure-mcp:2.0.0-beta.7`
- App Service Plan with Linux OS (B1 SKU for cost-effectiveness)
- Application Insights for monitoring and logging
- Key Vault for secrets management with RBAC authorization
- Storage Account for persistent data
- Managed identities (System + User Assigned) for secure access
- Standardized naming conventions using the namep provider
- Comprehensive logging configuration

## Outputs

After deployment, the following outputs will be available:

- `resource_group_name` - Name of the created resource group
- `service_plan_name` - Name of the app service plan
- `web_app_name` - Name of the web app
- `web_app_url` - Full HTTPS URL of the deployed MCP server
- `application_insights_connection_string` - Application Insights connection string (sensitive)
- `key_vault_name` - Name of the Key Vault
- `storage_account_name` - Name of the storage account

## Prerequisites

- Azure CLI logged in (`az login`)
- Terraform installed (>= 1.0)
- Appropriate Azure permissions to create resources:
  - Resource Group Contributor
  - Key Vault Administrator (for RBAC setup)
  - App Service Contributor

## Post-Deployment

Once deployed, the MCP server will be available at the `web_app_url` output. The container will automatically start and be accessible via HTTPS.
