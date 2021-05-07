output "ec2_public_ip" {
  value = aws_instance.webserver.public_ip
}
output "sg_name" {
  value = aws_security_group.web_sg.name
}
output "ec2_instance_state" {
  value = aws_instance.webserver.instance_state
}
output "sg_arn" {
  value = aws_security_group.web_sg.arn
}