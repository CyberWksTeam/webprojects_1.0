terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "instance_1" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.instances.name]
  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_instance" "instance_2" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.instances.name]
  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_instance" "instance_3" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.instances.name]
  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_instance" "instance_4" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.instances.name]
  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_instance" "instance_5" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.instances.name]
  tags = {
    Name = "ExampleAppServerInstance"
  }
}

data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet_ids" "default_subnet" {
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_security_group" "instances" {
  name = "instance-security-group"
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instances.id

  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}