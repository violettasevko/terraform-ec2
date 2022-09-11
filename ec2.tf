provider "aws" {
    region = var.AWS_Region
}

resource "aws_instance" "myinstance" {
  ami = var.ami_id
  instance_type = var.instance_type
  #key_name = var.web_key_name
  tags = {
        Name = "myinstance"
        owner = "violetta"        
    }
}
