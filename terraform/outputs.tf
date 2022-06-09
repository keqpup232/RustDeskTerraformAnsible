output "local_ip_address" {
  value = [for name in yandex_compute_instance.vm_for_each : "${name.name} is ${name.network_interface.0.ip_address}"]
}

output "external_ip_address" {
  value = [for name in yandex_compute_instance.vm_for_each : "${name.name} is ${name.network_interface.0.nat_ip_address}"]
}