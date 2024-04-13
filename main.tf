resource "aws_vpc" "Mimi-Project" {
    cidr_block = var.vpc_cidr
    instance_tenancy = var.instance_tenancy
    enable_dns_hostnames = var.enable_dns_hostnames

    tags = {
        Name = "Mimi-Project"
        env = "prod"
    }
}

# 2 public subnets
resource "aws_subnet" "Project-pub-sub-1" {
    vpc_id = aws_vpc.Mimi-Project.id
    cidr_block = var.Project-pub-sub-1-cidr
    availability_zone = var.availability_zone_1

    tags = {
        Name = "Project-pub-sub-1"
        env = "prod"
    }
}

resource "aws_subnet" "Project-pub-sub-2" {
    vpc_id = aws_vpc.Mimi-Project.id
    cidr_block = var.Project-pub-sub-2-cidr
    availability_zone = var.availability_zone_2

    tags = {
        Name = "Project-pub-sub-2"
        env = "prod"
    }
}

# 2 Private subnet
resource "aws_subnet" "Project-priv-sub-1" {
    vpc_id = aws_vpc.Mimi-Project.id
    cidr_block = var.Project-priv-sub-1-cidr
    availability_zone = var.availability_zone_1

    tags = {
        Name = "Project-priv-sub-1"
        env = "prod"
    }
}

resource "aws_subnet" "Project-priv-sub-2" {
    vpc_id = aws_vpc.Mimi-Project.id
    cidr_block = var.Project-priv-sub-2-cidr
    availability_zone = var.availability_zone_2

    tags = {
        Name = "Project-priv-sub-2"
        env = "prod"
    }
}

# Public Router
resource "aws_route_table" "Project-pub-router" {
  vpc_id = aws_vpc.Mimi-Project.id

  route {
    cidr_block = var.gateway_cidr
    gateway_id = aws_internet_gateway.Project-igw.id
  }

  tags = {
    Name = "Project-pub-router"
    env = "prod"
  }
}

# 1 Private router
resource "aws_route_table" "Project-priv-router" {
  vpc_id = aws_vpc.Mimi-Project.id

  route {
    cidr_block = var.gateway_cidr
    gateway_id =aws_nat_gateway.Project-ngw.id
  }

  tags = {
    Name = "Project-priv-router"
    env = "prod"
  }
}

# Subnet Association Public Router
resource "aws_route_table_association" "Public-RT1" {
    subnet_id = aws_subnet.Project-pub-sub-1.id
    route_table_id = aws_route_table.Project-pub-router.id
}

resource "aws_route_table_association" "Public-RT2" {
    subnet_id = aws_subnet.Project-pub-sub-2.id
    route_table_id = aws_route_table.Project-pub-router.id
}

# Subnet Association to Private Router
resource "aws_route_table_association" "Private-RT1" {
    subnet_id = aws_subnet.Project-priv-sub-1.id
    route_table_id = aws_route_table.Project-priv-router.id
}

resource "aws_route_table_association" "Private-RT2" {
    subnet_id = aws_subnet.Project-priv-sub-2.id
    route_table_id = aws_route_table.Project-priv-router.id
}

# IGW
# Create IGW
resource "aws_internet_gateway" "Project-igw" {
  vpc_id = aws_vpc.Mimi-Project.id

  tags = {
    Name = "Project-igw"
    env = "prod"
  }
}

#EIPs for NAt Gateway
resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.Project-igw]
}

#Create a Nat Gateway
resource "aws_nat_gateway" "Project-ngw" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.Project-pub-sub-1.id

  tags = {
    Name = "Project-ngw"
    env = "prod"
  }
}