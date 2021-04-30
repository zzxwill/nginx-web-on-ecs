resource "alicloud_eip" "server" {
  bandwidth            = "5"
  internet_charge_type = "PayByBandwidth"
  count                = 1
}

resource "alicloud_eip_association" "server" {
  allocation_id = alicloud_eip.server.0.id
  instance_id   = module.server.instance_id.0
}
