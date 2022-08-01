terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}


///By for each loop on map

resource "aws_instance" "test_instance" {
  for_each      = var.loop_name
  ami           = each.value.ami
  instance_type = each.value.ins_name

  tags = {
    name  = each.value.name,
    owner = each.key
  }
}