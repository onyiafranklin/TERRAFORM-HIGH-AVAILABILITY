variable "vpc_cidr" {
	type = string
	description = "CIDR Block for our environment VPC"
	default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
	type = string
	description = "CIDR Block for the public subnet"
	default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
	type = string
	description = "CIDR Block for the private subnet"
	default = "10.0.2.0/24"
}
	
