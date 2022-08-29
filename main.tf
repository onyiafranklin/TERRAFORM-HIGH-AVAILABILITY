terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_vpc" "main" {
	cidr_block = var.vpc_cidr
	enable_dns_hostnames = true
}

resource "aws_internet_gateway" "main_gateway" { }

resource "aws_internet_gateway_attachment" "main_gw_attachment" {
	vpc_id = aws_vpc.main.id
	internet_gateway_id = aws_internet_gateway.main_gateway.id
}

output "igw_id" {
	value = aws_internet_gateway.main_gateway.id
}

output "vpc_id" {
	value = aws_vpc.main.id
}

