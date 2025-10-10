
module "ec2_instance" {
  source        = "./module/ec2"
  name          = var.name
  ami_id        = var.ami_id
  instance_type = var.instance_type
}
