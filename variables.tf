variable "vpc_cidr" {
	type = string
	description = "CIDR Block for our environment VPC"
	default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
	type = string
	description = "CIDR Block for the public subnet"
	default = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
	type = string
	description = "CIDR Block for the public subnet"
	default = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
	type = string
	description = "CIDR Block for the private subnet"
	default = "10.0.3.0/24"
}

variable "private_subnet_2_cidr" {
	type = string
	description = "CIDR Block for the private subnet"
	default = "10.0.4.0/24"
}	
