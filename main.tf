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

// Availability zones
data "aws_availability_zones" "azs" {
	state = "available"
}

// VPC and IGW
resource "aws_vpc" "vpc" {
	cidr_block = var.vpc_cidr
	enable_dns_hostnames = true
}

resource "aws_internet_gateway" "igw" { }

resource "aws_internet_gateway_attachment" "igw_attachment" {
	vpc_id = aws_vpc.vpc.id
	internet_gateway_id = aws_internet_gateway.igw.id
}

// Subnets

resource "aws_subnet" "public_subnet_1" {
	cidr_block = var.public_subnet_1_cidr
	vpc_id = aws_vpc.vpc.id
	map_public_ip_on_launch = true
	availability_zone = data.aws_availability_zones.azs.names[0]
}

resource "aws_subnet" "public_subnet_2"{
	cidr_block = var.public_subnet_2_cidr
	vpc_id =aws_vpc.vpc.id
	map_public_ip_on_launch = true
	availability_zone = data.aws_availability_zones.azs.names[1]
}

resource "aws_subnet" "private_subnet_1" {
	cidr_block = var.private_subnet_1_cidr
	vpc_id = aws_vpc.vpc.id
	availability_zone = data.aws_availability_zones.azs.names[0]
}

resource "aws_subnet" "private_subnet_2" {
	cidr_block = var.private_subnet_2_cidr
	vpc_id = aws_vpc.vpc.id
	availability_zone = data.aws_availability_zones.azs.names[1]
}




// Outputs

output "igw_id" {
	value = aws_internet_gateway.igw.id
}

output "vpc_id" {
	value = aws_vpc.vpc.id
}

output "public_subnet_1"{
	value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2"{
	value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1"{
	value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2"{
	value = aws_subnet.private_subnet_2.id
}

