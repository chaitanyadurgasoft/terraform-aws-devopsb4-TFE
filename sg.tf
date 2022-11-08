module "prod_security" {
   source  = "app.terraform.io/Terraform-Devops-B4/devopsb4-sg/aws"
  vpc_id = module.prod_vpc.vpc_id
}