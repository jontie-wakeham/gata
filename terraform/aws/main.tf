provider "aws" {
  region                  = "ap-southeast-2"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}

resource "aws_instance" "test-instance" {
    ami                 = "ami-201720221991yay"
    instance_type       = "t2.micro"
    availability_zone   = "az_1"
}