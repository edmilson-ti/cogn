# VPC
resource "aws_vpc" "vpc_aula_hml" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-aula-hml"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_aula_hml.id

  tags = {
    Name = "igw-aula-hml"
  }
}

# Subnet 1
resource "aws_subnet" "sbnt_aula_hml_1a" {
  vpc_id            = aws_vpc.vpc_aula_hml.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "sbnt-aula-hml-1a"
  }
}

# Subnet 2
resource "aws_subnet" "sbnt_aula_hml_1b" {
  vpc_id            = aws_vpc.vpc_aula_hml.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "sbnt-aula-hml-1b"
  }
}

# Route Table 1
resource "aws_route_table" "rt_public_1a" {
  vpc_id = aws_vpc.vpc_aula_hml.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rt-public-1a"
  }
}

# Route Table 2
resource "aws_route_table" "rt_public_1b" {
  vpc_id = aws_vpc.vpc_aula_hml.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rt-public-1b"
  }
}

# Associação Subnet 1a à Route Table 1
resource "aws_route_table_association" "assoc_1a" {
  subnet_id      = aws_subnet.sbnt_aula_hml_1a.id
  route_table_id = aws_route_table.rt_public_1a.id
}

# Associação Subnet 1b à Route Table 2
resource "aws_route_table_association" "assoc_1b" {
  subnet_id      = aws_subnet.sbnt_aula_hml_1b.id
  route_table_id = aws_route_table.rt_public_1b.id
}
