output "vpc" {
  value = aws_vpc.Mimi-Project.id
}

output "Public-subnet-1" {
  value = aws_subnet.Project-pub-sub-1.id
}

output "Public-subnet-2" {
  value = aws_subnet.Project-pub-sub-2.id
}

output "Private-subnet-1" {
  value = aws_subnet.Project-priv-sub-1.id
}

output "Private-subnet-2" {
  value = aws_subnet.Project-priv-sub-2.id
}

output "Private-router" {
  value = aws_route_table.Project-priv-router.id
}

output "Public-router" {
  value = aws_route_table.Project-pub-router.id
}

output "IGW" {
    value = aws_internet_gateway.Project-igw.id
}

output "NGW" {
  value = aws_nat_gateway.Project-ngw.id
}

output "Security-group" {
    value = aws_security_group.Project-sg.id
}