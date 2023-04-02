resource "aws_iam_user" "jontie_wakeham" {
  name = "${var.jontie_wakeham_username}"
  path = "/"
}

resource "aws_iam_access_key" "jontie_wakeham" {
  user = "${aws_iam_user.jontie_wakeham.name}"
}

resource "aws_iam_user_login_profile" "jontie_wakeham" {
  user = "${aws_iam_user.jontie_wakeham.name}"
}

output "jontie_wakeham_key" {
  value = "${aws_iam_access_key.jontie_wakeham.encrypted_secret}"
}
