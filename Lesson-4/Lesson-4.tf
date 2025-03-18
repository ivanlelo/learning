#--------------------------------
#My terraform
#
#Build webserver during Bootsrap
#
#Made by  Ivan Lelo
#-------------------------------


provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_webserver" {
  ami                    = "ami-06ee6255945a96aba" #Amazon Linux AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Ivan"
    l_name = "Lelo"
    names  = ["Vasya", "Kolya", "Petya", "John", "Donald", "Masha"]
  })

  tags = {
    Name  = "Web Server Build by Terraform"
    Owner = "Ivan Lelo"
  }
}


resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security Group"
  description = "My First Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
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
    Name  = "Web Server SecurityGroup"
    Owner = "Ivan Lelo"
  }
}

