provider "aws" {
  region = var.aws_region
  profile = "temp"
}

module "vpc" {
  source = "./modules/vpc"
  project_name = var.project_name
}
