# ECS
variable "instance_count" {
  default = 1
}

variable "zone_id" {
  default = "cn-beijing-i"
}


variable "password" {
  default = "PasefjsfdY123!"
}

variable "image_suffix" {
  default =  "centos_8_3"
}


# VPC
variable "cidr_block_vpc" {
  default = "10.0.0.0/18"
}

variable "cidr_block_vswitch" {
  default = "10.0.0.0/20"
}

