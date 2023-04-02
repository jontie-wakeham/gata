terraform {
  backend "s3" {
    bucket = "gata-terraform-state"
    key    = "terraform.tfstate"
    region = "ap-southeast-2"
    profile = "default"
  }
}