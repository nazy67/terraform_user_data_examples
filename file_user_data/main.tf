resource "aws_instance" "web_instance" {
  depends_on             = [aws_security_group.web_instance_sg]
  ami                    = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_instance_sg.id]
  user_data              = file("user_data.sh")

  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_web_instance"
    }
  )
}