output "console_url" {
  value = "http://${alicloud_eip.server.0.ip_address}"
}
