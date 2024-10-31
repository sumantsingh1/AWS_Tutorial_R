provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "mycloudserver" {
  ami           = "ami-0ddc798b3f1a5117e"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mycloudserverSG.id]

  tags = {
    Name = "mycloudserver"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "mycloudserverSG" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default.id  # Corrected this line

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

