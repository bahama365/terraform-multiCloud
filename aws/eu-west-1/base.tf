provider "aws" {
 region     = "eu-west-1"
 access_key = var.access_key
 secret_key = var.secret_key
}

########## VPC

resource "aws_vpc" "terraform" {
 cidr_block = "10.0.0.0/16"
 enable_dns_support   = true
 enable_dns_hostnames = true
 tags = {
        Name = "terraform"
 }
}
