module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "task-1"

  #ami arm amilinux
  ami                    = "ami-05fab674de2157a80"
  instance_type          = "t4g.micro"
  availability_zone      = "us-east-1a"
  key_name               = "l1q_key"
  vpc_security_group_ids = ["sg-008d650fa174f6032"]
  subnet_id              = "subnet-008f1a536a8623779"
  associate_public_ip_address = true
  user_data = file("script")

  root_block_device = [{ 
    volume_size = 10
    volume_type = "gp3"
    }]
}

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = module.ec2_instance.id
}
resource "aws_ebs_volume" "this" {
  availability_zone =  "us-east-1a"
  size = 2
}
resource "aws_volume_attachment" "thiss" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.thiss.id
  instance_id = module.ec2_instance.id
}
resource "aws_ebs_volume" "thiss" {
  availability_zone =  "us-east-1a"
  size = 3
}
