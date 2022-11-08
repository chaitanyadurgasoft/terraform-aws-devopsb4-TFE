module "prod_elb" {
    source  = "app.terraform.io/Terraform-Devops-B4/devopsb4-elb/aws"
  nlbname        = "prod-nlb"
  subnets        = module.prod_vpc.PublicSubnet
  env            = module.prod_vpc.environment
  tgname         = "prod-nlb-tg"
  vpc_id         = module.prod_vpc.vpc_id
  PrivateServers = module.prod_ec2.Privateserver
  cert_arn       = aws_acm_certificate.cert.arn
}