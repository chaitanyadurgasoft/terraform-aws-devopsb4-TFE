module "prod_nat_gw" {
  source  = "app.terraform.io/Terraform-Devops-B4/devopsb4-nat/aws"
  Public_subnet_id = module.prod_vpc.PublicSubnet_1
  vpc_name         = module.prod_vpc.vpc_name
}