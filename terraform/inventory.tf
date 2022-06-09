resource "local_file" "inventory" {
  content = <<-DOC
    ---
    rustdesk:
      hosts:
        node-rustdesk:
          ansible_host: ${yandex_compute_instance.vm_for_each["rustdesk.mgexp.yc"].network_interface.0.nat_ip_address}
    DOC
  filename = "../playbook/inventory/prod.yml"

  depends_on = [
    yandex_compute_instance.vm_for_each
  ]
}