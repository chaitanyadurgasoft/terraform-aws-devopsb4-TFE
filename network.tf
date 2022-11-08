module "prod_vpc" {
    source  = "app.terraform.io/Terraform-Devops-B4/devopsb4-network/aws"
  vpc_cidr     = "10.185.0.0/16"
  vpc_name     = "prod_cgit-vpc"
  environment  = "prod"
  Public_cidr  = ["10.185.1.0/24", "10.185.2.0/24", "10.185.3.0/24"]
  Private_cidr = ["10.185.10.0/24", "10.185.20.0/24", "10.185.30.0/24"]
  azs          = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  natgw_id     = module.prod_nat_gw.natid
}
