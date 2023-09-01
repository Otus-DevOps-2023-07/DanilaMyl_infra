source "yandex" "ubuntu16" {
  service_account_key_file = "~/key.json"
  folder_id = "b1g2a5mhs8gsj54emue5"
  source_image_family = "ubuntu-1604-lts"
  image_name = "reddit-base-${formatdate("MM-DD-YYYY", timestamp())}"
  image_family = "reddit-base"
  ssh_username = "appuser"
  platform_id = "standard-v1"
}

build {
  sources = ["source.yandex.ubuntu16"]


  provisioner "shell" {
    name            = "ruby"
    script          = "scripts/install_ruby.sh"
    execute_command = "sudo {{.Path}}"
  }

  provisioner "shell" {
    name            = "mongodb"
    script          = "scripts/install_mongodb.sh"
    execute_command = "sudo {{.Path}}"
  }
  
}
