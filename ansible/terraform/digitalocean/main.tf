provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
  #
}

resource "digitalocean_ssh_key" "default" {
  name       = "Terraform Example"
  public_key = file("../../files/id_rsa.pub")
}

# Create a web server
resource "digitalocean_droplet" "web" {
    name  = "tf-1"
    image = "ubuntu-18-04-x64"
    region = "nyc1"
    size   = "512mb"
   ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]
}

data "template_file" "init" {
  template = "${file("${path.module}/../templates/init.tpl")}"
  vars = {
    consul_address = "${digitalocean_droplet.web.name}"
    consul_address1 = "${digitalocean_droplet.web.ipv4_address}"
  }
}

resource "null_resource" "inventories" {
  provisioner "local-exec" {
    command = "echo '${data.template_file.init.rendered}' > ${var.inventory_directory}"
  }

  triggers = {
    template = data.template_file.init.rendered
  }
}