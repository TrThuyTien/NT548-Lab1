provider "aws" {
  region = var.aws_region
  profile = "temp"
}

module "vpc" {
  source = "./modules/vpc"
  project_name = var.project_name
}

module "ec2" {
  source           = "./modules/ec2"
  project_name     = var.project_name
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id

  ami              = var.ec2_ami
  instance_type    = "t3.micro"
  key_name         = var.ec2_key_name
  my_ip_cidr       = var.my_ip_cidr
}
