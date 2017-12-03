locals {
  bastion_count = "${length(var.availability_zones)}"
}

resource "aws_instance" "bastion_host" {
  count = "${local.bastion_count}"
  ami = "${var.bastion_host_ami}"
  instance_type = "t2.micro"
  key_name = "${var.key_pair_name}"
  vpc_security_group_ids = ["${aws_security_group.bastion_host_sg.id}"]
  associate_public_ip_address = "true"
  availability_zone = "${element(var.availability_zones, count.index)}"
  subnet_id = "${element(module.vpc.public_subnets, count.index) }"

  tags = {
    Name = "bastion_host-${element(var.availability_zones, count.index)}"
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "bastion_host_sg" {
  name = "bastion_host_sg"
  description = "Allows all traffic"
  vpc_id = "${module.vpc.vpc_id}"

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}