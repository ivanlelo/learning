provider "aws" {
}


resource "aws_instance" "my_Ubuntu" {
  ami           = "ami-07eef52105e8a2059"
  instance_type = "t2.micro"
  tags = {
    Name    = "MyUbuntu server"
    Owner   = "Ivan Lelo"
    Project = "Terraform lessons"
  }
}
