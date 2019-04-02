# Security Group Configs
resource "aws_security_group" "vagas" {
  vpc_id = "${aws_vpc.default.default}"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
  }

  name = "VagasTerraform"
}

resource "aws_instance" "VagasTerraform" {
  ami             = "${var.ami}"
  instance_type   = "${var.instance_type}"
  key_name        = "vagas"
  security_groups = "${var.aws_security_group.vagas}"
  user_data       = "${file("./userdata/vagasterraform.sh")}"

  tags {
    Name        = "VagasTeste_Terraform"
    OS          = "ubuntu"
  }
}
