resource "aws_instance" "Project-ec2-1"{
  ami           = "ami-0f007bf1d5c770c6e"
  instance_type = "t2.micro"
  vpc_security_group_ids  = ["sg-0b85bd1b64589ac9e"]
  subnet_id = aws_subnet.Project-pub-sub-1.id
  key_name = "Godwin-KP"
  associate_public_ip_address = true
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx
EOF

  tags = {
    Name = "Project-ec2-1"
    }
}

resource "aws_instance" "Project-ec2-2"{
  ami           = "ami-0f007bf1d5c770c6e"
  instance_type = "t2.micro"
  vpc_security_group_ids  = ["sg-0b85bd1b64589ac9e"]
  subnet_id = aws_subnet.Project-pub-sub-2.id
  key_name = "Godwin-KP"
  associate_public_ip_address = true
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1> This is my load balancer $(hostname -f) in AZ $EC2_AVAIL_ZONE </h1>" > /var/www/html/index.html
EOF

  tags = {
    Name = "Project-ec2-2"
    }
}