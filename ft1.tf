

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_instance" "project" {
  ami           = "ami-0fa377108253bf620"
  instance_type = "t1.micro"

  root_block_device {
    encrypted = true
  }

  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_size           = 5
    volume_type           = "gp2"
    delete_on_termination = false
    encrypted             = true
  }
}
