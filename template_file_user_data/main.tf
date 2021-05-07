
resource "aws_instance" "webserver" {
  depends_on             = [aws_security_group.web_sg]
  ami                    = "ami-0be2609ba883822ec"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data              = data.template_file.user_data.rendered

  tags = {
    Name        = "webserver_${var.env}"
    Environment = var.env
  }
}

data "template_file" "user_data" {
  template = file("template_file/user_data.sh")
  vars = {
    env = var.env
  }
}