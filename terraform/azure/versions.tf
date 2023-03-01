terraform {
  required_version = ">= 0.13.1"

  required_providers {
    terraform-provider-azurerm = {
      source  = "hashicorp/terraform-provider-azurerm"
      version = ">= 3.45.0"
    }
  }
}
