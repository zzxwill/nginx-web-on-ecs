resource "alicloud_vpc" "vpc" {
  vpc_name = "poc"
  cidr_block = var.cidr_block_vpc
}

resource "alicloud_vswitch" "vsw" {
  vpc_id = alicloud_vpc.vpc.id
  cidr_block = var.cidr_block_vswitch
  zone_id = var.zone_id
}