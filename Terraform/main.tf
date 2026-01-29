resource "aws_instance" "assignment_instance" {
  ami = "ami-019715e0d74f695be"
  instance_type = "t2.micro"
  key_name = "devops-assignment"

  vpc_security_group_ids = [
    aws_security_group.instance_sg.id
  ]

#   security_groups = aws_security_group.instance_sg

  tags = {
    Name = "Ec2-assignment-vm"
  }

}

resource "aws_security_group" "instance_sg" {
  name        = "instance-security-group"
  description = "Allow SSH, HTTP, and HTTPS"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "instance-sg"
  }
}
