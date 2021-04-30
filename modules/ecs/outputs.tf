output "instance_id" {
  value = alicloud_instance.inst.*.id
}

output "private_id" {
  value = alicloud_instance.inst.*.private_ip
}
