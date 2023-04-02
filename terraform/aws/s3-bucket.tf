resource "aws_s3_bucket" "terraform-state" {
  bucket        = "${var.terraform_state_bucket_name}"
  acl           = "private"
  versioning {
    enabled     = true
  }

  tags {
    Name        = "${var.terraform_state_bucket_name}"
  }
}