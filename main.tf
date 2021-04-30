# ECS
data "alicloud_instance_types" "server" {
  cpu_core_count    = 2
  memory_size       = 4
  availability_zone = var.zone_id
}

# ECS
data "alicloud_images" "server" {
  most_recent = true
  name_regex  = var.image_suffix
}

# VPC
module "vpc" {
  source             = "./modules/vpc"
  zone_id            = var.zone_id
  cidr_block_vpc     = var.cidr_block_vpc
  cidr_block_vswitch = var.cidr_block_vswitch
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "server" {
  raw_instance_name  = "webapp"
  source             = "./modules/ecs"
  image_id           = data.alicloud_images.server.images[0].id
  instance_type      = data.alicloud_instance_types.server.instance_types.0.id
  security_groups    = module.security_group.security_group_ids
  vswitch_id         = module.vpc.vswitch_id
  password           = var.password
  ecs_instance_count = var.instance_count
}

data "template_file" "server" {
  template = file("${path.module}/assets/index.html")
  vars = {
    ip = alicloud_eip.server[0].ip_address
  }
}

resource "null_resource" "deploy" {
  depends_on = [
    data.template_file.server,
  module.server]

  connection {
    password = var.password
    host     = alicloud_eip.server[0].ip_address
  }

  provisioner "remote-exec" {
    inline = [
      "yum install nginx -y",
      "service nginx start",
    ]
  }

  provisioner "file" {
    source      = "${path.module}/assets/index.html"
    destination = "/usr/share/nginx/html/index.html"
  }
}
