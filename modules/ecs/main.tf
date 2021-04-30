resource "alicloud_instance" "inst" {
  image_id                   = var.image_id
  internet_charge_type       = "PayByTraffic"
  instance_type              = var.instance_type
  system_disk_category       = "cloud_efficiency"
  security_groups            = var.security_groups
  vswitch_id                 = var.vswitch_id
  count                      = var.ecs_instance_count
  instance_name              = var.instance_name != "" ? var.instance_name: format("%s-%s", var.raw_instance_name, format(var.number_format, count.index))
  host_name                  = var.host_name != "" ? var.host_name: format("%s-%s", var.raw_instance_name, format(var.number_format, count.index))
  password                   = var.password
  system_disk_size           = var.system_disk_size
  user_data                  = var.user_data
}