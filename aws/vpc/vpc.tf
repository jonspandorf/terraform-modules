# Internet VPC
resource "aws_vpc" "project-network" {
  cidr_block           = var.network_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = var.project_network
  }
}


resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.project-network.id

  tags = {
    Name = "main-gw"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.project-network.id
  cidr_block              = var.subnet_public_network
  map_public_ip_on_launch = "true"
  availability_zone       = var.availabilityzone_a

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "main-private" {
  vpc_id                  = aws_vpc.project-network.id
  cidr_block              = var.subnet_private_network
  map_public_ip_on_launch = "false"
  availability_zone       = var.availabilityzone_b

  tags = {
    Name = "private-subnet"
  }
}


resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.project-network.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }

  tags = {
    Name = "routing-public"
  }
}

resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.main-public.id
}