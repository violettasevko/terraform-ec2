module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "jenkins1"

  ami                    = "ami-0b83282d4c7adda4c"
  instance_type          = "t4g.small"
  key_name               = "hoi22"
  vpc_security_group_ids = ["sg-0bc2447cb2a6e9bc5"]
  subnet_id              = "subnet-07e2128167d8cbd9d"
  associate_public_ip_address = true

root_block_device = [
    {
      encrypted   = true
      volume_type = "gp3"
      volume_size = 8
    },
  ]


  tags = {
    owner   = "violetta"
  }
}
