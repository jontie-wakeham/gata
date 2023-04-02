terraform {
  required_version  = ">= 0.13.1"

  required_providers {
    aws = {
      source        = "hashicorp/aws"
      version       = ">= 4.56.0"
      region        = "ap-southeast-2"
      profile       = "default"
    } 
  }
}
