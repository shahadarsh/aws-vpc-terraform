data "terraform_remote_state" "network_remotestate" {
  backend = "s3"

  config {
    bucket = "tf-state.shahadarsh.com"
    key = "aws-vpc-terraform/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

locals {
  nginx_count = "${length(var.availability_zones)}"
}

resource "aws_instance" "nginx" {
  count = "${local.nginx_count}"
  ami = "${var.nginx_ami}"
  instance_type = "t2.micro"
  key_name = "${var.key_pair_name}"
  vpc_security_group_ids = ["${aws_security_group.nginx_sg.id}"]
  availability_zone = "${element(var.availability_zones, count.index)}"
  subnet_id = "${element(data.terraform_remote_state.network_remotestate.private_subnets, count.index)}"

  tags = {
    Name = "nginx-${element(var.availability_zones, count.index)}"
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "nginx_sg" {
  name = "nginx_sg"
  description = "Security group for nginx instances"
  vpc_id = "${data.terraform_remote_state.network_remotestate.vpc_id}"

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    security_groups = ["${data.terraform_remote_state.network_remotestate.bastion_host_sg_id}"]
  }
}