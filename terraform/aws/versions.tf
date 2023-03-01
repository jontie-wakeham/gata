terraform {
  required_version = ">= 0.13.1"

  required_providers {
    terraform-provider-aws = {
      source  = "hashicorp/terraform-provider-aws"
      version = ">= 4.56.0"
    }
  }
}
