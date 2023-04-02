resource "aws_eip" "ssh_server" {
  instance = "${aws_instance.ssh_server.id}"
  vpc      = true
}

resource "aws_network_interface" "ssh_server" {
  subnet_id = "${aws_subnet.A_public.id}"
  security_groups = ["TBA"]
  private_ips     = ["172.16.0.10"]
  tags {
    Name          = "gata_bastion_primary_network_interface"
  }
}

resource "aws_instance" "ssh_server" {
  ami                    = "${data.aws_ami.amazon_linux_instance.id}"
  instance_type           = "t2.small"
  key_name                = "${aws_key_pair.corp_ssh_server.key_name}"
  iam_instance_profile    = "${aws_iam_instance_profile.ssh_server.name}"
  disable_api_termination = true

  network_interface {
    network_interface_id = "${aws_network_interface.ssh_server.id}"
    device_index         = 0
  }

  tags {
    Name                = "gata-bastion"
    Start_Instances     = "true"
  }
}