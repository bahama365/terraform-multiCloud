resource "aws_subnet" "web1" {
 vpc_id     = aws_vpc.terraform.id
 availability_zone = "eu-west-2a"
 cidr_block = "10.0.1.0/24"
 tags = {
        Name = "terraform_web1"
 }
}

resource "aws_route_table_association" "terraform_web1" {
 subnet_id      = aws_subnet.web1.id
 route_table_id = aws_route_table.terraform.id
}

resource "aws_subnet" "web2" {
 vpc_id     = aws_vpc.terraform.id
 availability_zone = "eu-west-2b"
 cidr_block = "10.0.2.0/24"
 tags = {
        Name = "terraform_web2"
 }
}

resource "aws_route_table_association" "terraform_web2" {
 subnet_id      = aws_subnet.web2.id
 route_table_id = aws_route_table.terraform.id
}

resource "aws_subnet" "web3" {
 vpc_id     = aws_vpc.terraform.id
 availability_zone = "eu-west-2c"
 cidr_block = "10.0.3.0/24"
 tags = {
        Name = "terraform_web3"
 }
}

resource "aws_route_table_association" "terraform_web3" {
 subnet_id      = aws_subnet.web3.id
 route_table_id = aws_route_table.terraform.id
}

########## Internet Gateway

resource "aws_internet_gateway" "terraform" {
 vpc_id = aws_vpc.terraform.id
 tags = {
        Name = "terraform"
 }
}

########## Route Table

resource "aws_route" "terraform" {
 route_table_id         = aws_route_table.terraform.id
 destination_cidr_block = "0.0.0.0/0"
 gateway_id             = aws_internet_gateway.terraform.id
}

########## Route Table

resource "aws_route_table" "terraform" {
 vpc_id = aws_vpc.terraform.id
 tags = {
        Name = "terraform"
 }
}
