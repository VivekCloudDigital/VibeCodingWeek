resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "Hello from Terraform EC2" > /var/www/html/index.html
              EOF

  tags = {
    Name = "TerraformWeb"
  }
}
