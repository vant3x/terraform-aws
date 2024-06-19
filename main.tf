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
    for_each = var.service_names
    ami = "ami-011899242bb902164" #Ubuntu 20.04 LTS
    instance_type = "t2.micro"
    subnet_id = "subnet-09df844648cd5511f"
    tags = {
        ExtraTag = local.extra_tag
        Name = "EC2-${each.key}"
    }
}

resource "aws_cloudwatch_log_group" "ec2_log_group" {
    for_each = var.service_names
    tags = {    
        Environment = "test"
        Service = each.key
    }
    lifecycle {
      create_before_destroy = true
    }
}



