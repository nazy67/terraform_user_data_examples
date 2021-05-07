resource "aws_instance" "web_instance" {
  ami             = var.image_id
  instance_type   = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_instance_sg.id]
  user_data = <<EOF
          #!/bin/bash
          sudo yum update -y
          sudo yum install -y httpd 
          sudo systemctl start httpd
          sudo systemctl enable httpd
          echo "Welcome" > /var/www/html/index.html
  EOF
  tags = {
    Name = "web_instance"
  }
}