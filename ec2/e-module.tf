module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "task-1"

  ami                    = "ami-0c0fcae772c706bbe"
  instance_type          = "t4g.micro"
  availability_zone      = "eu-central-1a"
  key_name               = "hoi22"
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = "subnet-07e2128167d8cbd9d"
  associate_public_ip_address = true
   enable_volume_tags = false
  root_block_device = [
    {
    volume_size = 10
    volume_type = "gp3"
    encrypted   = false
    throughput  = 100
    tags = {
        Name = "root-block"
      }
    },
  ]
  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp3"
      volume_size = 2
      throughput  = 100
      encrypted   = false
    },
    {
      device_name = "/dev/sdg"
      volume_type = "gp3"
      volume_size = 1
      throughput  = 100
      encrypted   = false
    }
  ]
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "myverysecgrforvpc"
  description = "violettas security"
  vpc_id      = "vpc-0fdbb582d143b8021"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}


