resource "aws_instance" "web" {
  ami = data.aws_ami.latest.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "TerraformEC2"
  }
}
