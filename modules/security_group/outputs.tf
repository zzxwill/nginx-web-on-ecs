output "security_group_ids" {
  value = alicloud_security_group.sg.*.id
}

output "security_group_id" {
  value = alicloud_security_group.sg.id
}