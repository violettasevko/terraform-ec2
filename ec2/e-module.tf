module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "task-1"

  ami                    = "ami-0c0fcae772c706bbe"
  instance_type          = "t4g.micro"
  availability_zone      = "eu-central-1a"
  key_name               = "hoi22"
  vpc_security_group_ids = [sg-0bc2447cb2a6e9bc5]
  subnet_id              = "subnet-07e2128167d8cbd9d"
  associate_public_ip_address = true

  root_block_device = [{ 
    volume_si\ze = 10
    volume_type = "gp3"
    }]
}

provisoner "file" {
    sourse = "./script"
    destination = "./script"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x ./script",
      "sudo ./script",
    ]
  }ы

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = module.ec2_instance.id
}
resource "aws_ebs_volume" "this" {
  availability_zone =  "eu-central-1a"
  size = 2
}
resource "aws_volume_attachment" "thiss" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.thiss.id
  instance_id = module.ec2_instance.id
}
resource "aws_ebs_volume" "thiss" {
  availability_zone =  "eu-central-1a"
  size = 3
}
