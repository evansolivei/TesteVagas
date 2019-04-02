# Security Group Configs
resource "aws_security_group" "vagas" {
  vpc_id = "${aws_vpc.default.default}"
  name = "VagasTerraform"
}

resource "aws_instance" "VagasTerraform" {
  ami             = "${var.ami}"
  instance_type   = "${var.instance_type}"
  key_name        = "vagas"
  security_groups = "${var.aws_security_group.vagas}"
  user_data       = "${file("./userdata/vagasterraform.sh")}"

  tags {
    Name        = "Vagas_Terraform"
    OS          = "ubuntu"
  }
}
