module "prod_security" {
  source = "../main/security/"
  vpc_id = module.prod_vpc.vpc_id
}