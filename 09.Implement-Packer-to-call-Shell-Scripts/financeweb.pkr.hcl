packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}


source "amazon-ebs" "financeweb" {
  ami_name      = "financeweb-packer-linux-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "us-west-2"
  source_ami_filter {
    filters = {
      name                = "al2023-ami-2023.*.*.0-kernel-6.1-x86_64"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["137112412989"]
  }
  ssh_username = "ec2-user"
}

build {
  sources = [
    "source.amazon-ebs.financeweb"
  ]

  provisioner "file" {
    source = "../Finance_website"
    destination = "/home/ec2-user/Finance_website"

  }

  provisioner "shell" {
    script = "./app.sh"


  }


}
