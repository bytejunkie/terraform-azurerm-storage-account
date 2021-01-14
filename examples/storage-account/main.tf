provider "azurerm" {
  features {}
}

resource "random_pet" "pet" {
  keepers = {
    # Generate a new pet name each time we switch to a new AMI id
  }
  separator = ""

}
#################
# pre-requisites
#################

module "resourcegroup" {
  source = "bytejunkie/resource-group/azurerm"

  #location       = "west europe"
  name_strings   = ["byt", "rsg", random_pet.pet.id]
  name_separator = "-"

  #   tags = var.tags
}

#################
# this module
#################

module "storage_account" {
  source = "../../"

  name_strings        = ["byt", "sto", random_pet.pet.id]
  resource_group_name = module.resourcegroup.resource_group_name
  location            = "west europe"

  allow_blob_public_access  = "true"
  enable_https_traffic_only = "true"

  depends_on = [
    module.resourcegroup
  ]

  tags = {
    location = "west europe"
  }
}
