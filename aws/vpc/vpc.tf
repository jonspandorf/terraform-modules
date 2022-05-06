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

resource "aws_subnet" "public-subnets" {
  count = length(var.public_subnets)

  vpc_id                  = aws_vpc.project-network.id
  cidr_block              = element(var.public_subnets, count.index)
  map_public_ip_on_launch = "true"
  availability_zone       = element(var.availability_zones, count.index)

  tags = {
    Name = "public-subnet-${count.index+1}"
  }
}

resource "aws_subnet" "main-private" {

  count = length(var.private_subnets)

  vpc_id                  = aws_vpc.project-network.id
  cidr_block              = element(var.private_subnets, count.index)
  map_public_ip_on_launch = "false"
  availability_zone       = element(var.availability_zones, count.index)

  tags = {
    Name = "private-subnet-${count.index+1}"
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

resource "aws_route_table_association" "main-public-route" {
  count = length(var.public_subnets)
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id = aws_route_table.main-public.id
}

output "required-output-vars-projectnetwork-id" {
  value = aws_vpc.project-network.id
}

output "required-output-vars-subnetid" {
  value = aws_subnet.public-subnets.*.id
}