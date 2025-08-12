# These variables will be used to configure the Terraform backend on Azure
# The subscription ID of the tenant used to access Azure is needed before applying the plan. 

azure_subscription_id = ""      # Fill with Subscription ID


# Feel free to change the remaining default values. 

region = "useast1"     # Must be a valid region
rg_name = "production-rg-01"
store_name = "storage-01"
cont_name = "terraform-backend"