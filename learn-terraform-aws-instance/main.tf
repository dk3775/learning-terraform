terraform {
  backend "remote" {
    organization = "learning-tf-dk"
    workspaces {
      name = "Example-Workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

