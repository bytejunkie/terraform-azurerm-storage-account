resource "azurerm_storage_account" "this_storage_account" {
  name                = join("", var.name_strings)
  location            = var.location
  resource_group_name = var.resource_group_name

  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = merge({
    Module-Name = "Azure Storage Account"
    Author      = "bytejunkie - matt@bytejunkie.dev"
    },
    var.tags
  )
}
