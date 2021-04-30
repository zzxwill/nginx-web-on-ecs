# ECS
variable "instance_name" {
  default = ""
}

variable "raw_instance_name" {
  default = ""
}

variable "instance_type" {
  default = "ecs.c6.large"
}

variable "number_format" {
  description = "The number format used to output."
  default = "%02d"
}

variable "ecs_instance_count" {
  default = 1
}

variable "password" {
  default = "PafwrfdifjFaked"
}

variable "user_data" {
  default = ""
}

variable "image_id" {
  default = ""
}

variable "host_name" {
  default = ""
}

variable "system_disk_size" {
  default = 20
}

variable "security_groups" {
  default = [
    "sg-xxxxxxxx",
  ]
}

variable "vswitch_id" {
  default = ""
}
