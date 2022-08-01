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

// By usnig set variable
resource "aws_instance" "test_instance" {
  for_each      = toset(var.set)
  ami           = "ami-08df646e18b182346"
  instance_type = "t2.micro"

  tags = {
    name  = each.key,
    owner = "Gagan"
  }
}