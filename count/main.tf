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

//by usnig Count loop
resource "aws_instance" "test_instance" {
  count         = length(var.ami)
  ami           = var.ami[count.index]
  instance_type = var.ins_name[0]

  tags = {
    Name  = var.name[count.index],
    owner = var.owner[0]
  }
}