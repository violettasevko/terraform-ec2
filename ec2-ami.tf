provider "aws" {
    region = var.AWS_Region
}

resource "aws_instance" "ec2" {
    #for_each = var.availability_zones

    ami = "${lookup(var.AMI1, "ami-arm")}"
    instance_type = var.instance_type
    # VPC
    subnet_id = aws_subnet.subnet_public["${AWS_Region}"].id
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.webserver.id}"]
    # the Public SSH key
    key_name = var.web_key_name
    
    tags = {
        Name = "ami-arm"
        owner = "violetta"        
    }
}