variable "nginx_ami" {
  type = "string"
  description = "Ami for nginx"
}

variable "key_pair_name" {
  type = "string"
  description = "Key pair name associated with instance"
}

variable "availability_zones" {
  type        = "list"
  default     = []
  description = "List of Availability Zones (e.g. `['us-east-1a', 'us-east-1b', 'us-east-1c']`)"
}