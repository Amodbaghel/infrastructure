resource "aws_instance" "hello" {
  ami           = var.ami-id
  instance_type = var.instance-type
  tags = {
    name = "var.name"
  }
}
