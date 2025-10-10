module "ec2_instance" {
  source        = "./module/ec2"
  name          = var.name
  ami           = var.ami-id
  instance_type = var.instance-type
}
