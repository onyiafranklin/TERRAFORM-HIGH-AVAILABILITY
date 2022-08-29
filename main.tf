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

data "aws_availability_zones" "azs" {
	state = "available"
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

// Subnets

resource "aws_subnet" "public_subnet_1" {
	cidr_block = var.public_subnet_cidr
	vpc_id = aws_vpc.main.id
	map_public_ip_on_launch = true
	availability_zone = data.aws_availability_zones.azs.names[0]
}

resource "aws_subnet" "private_subnet_1" {
	cidr_block = var.private_subnet_cidr
	vpc_id = aws_vpc.main.id
	availability_zone = data.aws_availability_zones.azs.names[5]
}




// Outputs

output "igw_id" {
	value = aws_internet_gateway.main_gateway.id
}

output "vpc_id" {
	value = aws_vpc.main.id
}

