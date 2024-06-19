terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

locals {
  extra_tag = "extra-tag"
}

resource "aws_instance" "exampleterra2" {
    ami = "ami-011899242bb902164" #Ubuntu 20.04 LTS
    instance_type = "t2.micro"
    tags = {
        ExtraTag = local.extra_tag
    }
}



