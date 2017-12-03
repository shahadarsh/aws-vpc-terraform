output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "private_subnets" {
  value = "${module.vpc.private_subnets}"
}

output "public_subnets" {
  value = "${module.vpc.public_subnets}"
}

output "nat_ids" {
  value = "${module.vpc.nat_ids}"
}

output "bastion_host_sg_id" {
  value = "${aws_security_group.bastion_host_sg.id}"
}