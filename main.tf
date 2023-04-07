# Get the current client configuration from the AzureRM provider.
# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# Management Group.

# Declare the Azure landing zones Terraform module
# and provide a base configuration.
data "azurerm_client_config" "core" {
  provider = azurerm
}

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "3.3.0"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name
  library_path   = "${path.root}/lib"

  deploy_core_landing_zones = true
  deploy_corp_landing_zones = false
  deploy_online_landing_zones = false


  custom_landing_zones = {
    "${var.root_id}-corp" = {
      display_name               = "${upper(var.root_id)} corp"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_corp"
        parameters     = {}
        access_control = {}
      }
    },
    "${var.root_id}-online" = {
      display_name               = "${upper(var.root_id)} online"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_online"
        parameters     = {}
        access_control = {}
      }
    },
    "${var.root_id}-bankonline" = {
      display_name               = "${upper(var.root_id)} bankonline"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_bankonline"
        parameters     = {}
        access_control = {}
      }
    }



  }


}