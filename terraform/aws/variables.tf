variable "vpc_name" {
    description = "Name of the VPC"
    default = "gata-vpc"
}

variable "igw_name" {
    description = "Name of the internet gateway"
    default = "gata-igw"
}

variable "vpc_cidr_block" {
    description = "Private CIDR block"
    default = "172.16.0.0/16"
}

variable "jontie_wakeham_username" {
    description = "Jontie Wakeham"
    default = "jontie.subscriptions+gata@gmail.com"
}

variable "super_user_members" {
  type = "list"
  default = [
    "jontie.subscriptions+gata@gmail.com"
  ]
}

variable "terraform_state_bucket_name" {
 description = "S3 bucket for storing state file"
 default = "gata-terraform-state"
}