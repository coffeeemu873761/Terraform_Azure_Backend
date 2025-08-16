This is used to create an Azure-based backend for secure storage and multi-user capabilities of a Terraform state file.
In a few steps, you can construct the backend infrastructure, create a secure method of access to the storage infrastructure, and use the infrastructure as a remote backend for Terraform.

### Create Backend Infrastructure:

1. Run `terraform init` to intialize the plan.
2. Run `terraform apply` to apply the plan and create the infrastructure to store the state remotely.
3. Save the Storage Account Name that is outputed when the infrastructure is configured. This will be used when setting up the backend block.

### Configure Terraform backend state: 
1. Add the backend section to the Terraform configuration block

```
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "<storage_account_name>"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
      use_azuread_auth     = true
  }
```
Replace the `<storage_account_name>` with the name outputed from the initial infrastructure configuration.

2. Run `terraform init' again to reinitialize the directory.
