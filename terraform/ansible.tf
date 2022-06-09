resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 50"
  }

  depends_on = [
    local_file.inventory
  ]
}

resource "null_resource" "cluster" {
  provisioner "local-exec" {
    command = "ansible-playbook -i ../playbook/inventory/prod.yml ../playbook/site.yml"
  }

  depends_on = [
    null_resource.wait
  ]
}