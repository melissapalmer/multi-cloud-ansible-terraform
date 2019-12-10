provider "aws" {
  region                  = "eu-west-3"
} 
resource "aws_instance" "web" {
  ami = "ami-087855b6c8b59a9e4"
  instance_type = "t2.micro"
}