variable "instance_type" {
  type        = string
  default = "t2.micro"
  description = "this is instance type of EC2"
}

variable "image_id" {
  type        = string
  default = "ami-0be2609ba883822ec"
  description = "this is image id for EC2"
}

variable "sg_name" {
  type        = string
  default = "web_instance_sg"
  description = "the name of the sec grp"
}

variable "ssh_port" {
  type = number
  default = 22
  description = "this is ssh port for ingress"
}

variable "http_port" {
  type = number
  default = 80
  description = "this is ssh port for ingress"
}

variable "protocol" {
  type = string 
  default = "tcp"
  description = "this is protocol for EC2"
}