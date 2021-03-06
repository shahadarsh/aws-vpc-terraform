variable "bastion_host_ami" {
  type = "string"
  description = "ami used by Bastion Host"
}

variable "key_pair_name" {
  type = "string"
  description = "Key pair name associated with bastion instance"
}

variable "availability_zones" {
  type        = "list"
  default     = []
  description = "List of Availability Zones (e.g. `['us-east-1a', 'us-east-1b', 'us-east-1c']`)"
}