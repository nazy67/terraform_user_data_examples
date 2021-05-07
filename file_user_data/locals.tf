locals {
  common_tags = {
    environment = var.env
    project     = "${var.env}-wordpress"
    team        = "DevOps"
    owner       = "Nazy"
    timestamp = timestamp()
  }
}