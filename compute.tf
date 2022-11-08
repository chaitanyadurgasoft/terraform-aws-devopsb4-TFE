module "prod_ec2" {
    source  = "app.terraform.io/Terraform-Devops-B4/devopsb4-compute/aws"
  environment = module.prod_vpc.environment
  amis = {
    "us-east-1"  = "ami-08c40ec9ead489470"
    "us-east-2"  = "ami-097a2df4ac947655f"
    "eu-west-2"  = "ami-0f540e9f488cfa27d"
    "ap-south-1" = "ami-062df10d14676e201"
  }
  region        = var.aws_region
  instance_type = "t2.micro"
  key_name = {
    "us-east-1"  = "AWSB1ONLINE-KEY"
    "us-east-2"  = "AWSB10NLINE-OHIO"
    "ap-south-1" = "AWSB1ONLINE-MUMBAI"
  }
  PublicSubnet  = module.prod_vpc.PublicSubnet
  PrivateSubnet = module.prod_vpc.PrivateSubnet
  sg_id         = module.prod_security.sg_id
  vpc_name      = module.prod_vpc.vpc_name
  # depends_on = [
  #   module.prod_nat_gw.natgwid,
  #   module.prod_elb.elb_listner
  # ]

}
