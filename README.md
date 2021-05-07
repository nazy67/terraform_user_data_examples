# Terraform user_data examples

This repository contains the examples of user_data file can be attached to your instance, there's several ways of doing it. We can see it in the examples below.

## Description

The first example of user_data bash script is easy to read and if you have a small script it's ok to use, but we try to keep our code clean, short and reusable. For that reason it's common to have user_data as a separatre file. If we want to modify our script we can do it from user_data.tf file and don't do any changes in main.tf
```
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
```

How we can use `file` function for user data is shown is a second example. We have our user data in a separate file and Terraform is getting the data from user_data.tf file and attaching it webserver instance.  

When we use template file 


## Notes

- `file` reads a file from disk and returns its literal contents without any template interpretation.

- `templatefile` reads the file at the given path and renders its content as a template using a supplied set of template variables.


## Resources

## Useful Links 

[file Function](https://www.terraform.io/docs/language/functions/file.html)

[templatefile Function](https://www.terraform.io/docs/language/functions/templatefile.html)
