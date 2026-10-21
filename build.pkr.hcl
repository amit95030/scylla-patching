
packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = ">= 1.3.9"
    }

    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = ">= 1.1.0"
    }
  }
}

build {
  sources = [
    "source.amazon-ebs.rhel"
  ]

  provisioner "shell" {
    only = ["amazon-ebs.rhel"]

    inline = [
      "sudo dnf install -y openssh-server python3"
    ]
  }

  provisioner "ansible" {
    playbook_file = "ansible/install-scylla.yml"
    user          = "ec2-user"

    extra_arguments = [
      "--extra-vars",
      "scylla_version=${var.scylla_version}",
      "--scp-extra-args=-O"
    ]
  }
}
