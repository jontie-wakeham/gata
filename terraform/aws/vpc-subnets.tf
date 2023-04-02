resource "aws_subnet" "A_public" {
  vpc_id     = "${aws_vpc.gata.id}"
  cidr_block = "172.16.0.0/20"
  map_public_ip_on_launch = true
  availability_zone = "ap-southeast-2a"

  tags {
    Name = "gata-A-public"
    Reach = "public"
  }
}

resource "aws_subnet" "A_private" {
  vpc_id     = "${aws_vpc.gata-vpc.id}"
  cidr_block = "172.16.16.0/20"
  availability_zone = "ap-southeast-2a"

  tags {
    Name = "gata-A-private"
    Reach = "private"
  }
}