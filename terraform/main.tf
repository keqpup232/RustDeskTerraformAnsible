provider "yandex" {
  service_account_key_file = "key.json"
  zone      = "ru-central1-a"
  folder_id = "b1g7evdi2gkc7jqre2af"
}

data "yandex_compute_image" "my_image" {
  family = "centos-7"
}

resource "yandex_vpc_network" "foo" {
}

resource "yandex_vpc_subnet" "foo" {
  zone       = "ru-central1-a"
  network_id = yandex_vpc_network.foo.id
  v4_cidr_blocks = ["192.168.101.0/24"]
}

resource "yandex_compute_instance" "vm_for_each" {

  for_each = local.web_instance_each_map[terraform.workspace]

  name = each.value
  hostname = each.key
  zone = "ru-central1-a"

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.foo.id
    nat        = true
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}