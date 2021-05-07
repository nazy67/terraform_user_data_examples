# Terraform user_data examples

<p>
This repository contains the examples of user_data file can be attached to your instance, there's several ways of doing it. We can see it in the examples below.
</p>

## Description

<p>
The first example of user_data bash script is easy to read and if you have a small script it's ok to use, but we try to keep our code clean, short and reusable. For that reason it's common to have user_data as a separatre file. If we want to modify our script we can do it from user_data.tf file and don't do any changes in main.tf
</p>

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

The next example is with [file function](https://www.terraform.io/docs/language/functions/file.html), it is very simple to use file function, we just need to give a path to the user_data.sh file and Terraform will be able to find it. It's common t have user_data.tf in a separate file and because we don't know how big our code will get.

```
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
```

When we use template file, it is little different than file function. This function just allows longer template sequences to be factored out into a separate file for readability. With template file we use another 


## Notes

- `file` function reads a file from disk and returns its literal contents without any template interpretation.

- `template_file` data source renders a template from a template string, which is usually loaded from an external file.
