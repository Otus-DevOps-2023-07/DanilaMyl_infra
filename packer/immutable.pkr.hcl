source "yandex" "ubuntu16v2" {
  service_account_key_file = "${var.service_account_key_file}"
  folder_id = "${var.folder_id}"
  use_ipv4_nat = true
  source_image_family = "${var.source_image_family}"
  image_name = "reddit-base-${formatdate("MM-DD-YYYY", timestamp())}"
  image_family = "reddit-full"
  ssh_username = "ubuntu"
  platform_id = "standard-v1"
}

build {
  sources = ["source.yandex.ubuntu16v2"]

  provisioner "shell" {
    script =  "files/install_mongodb_reddit.sh"
    execute_command = "sudo {{.Path}}"
  }

}
