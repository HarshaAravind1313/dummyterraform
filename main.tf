provider "aws" {
region = "us-east-1"
}

terraform {
  backend "remote" {
    organization = "harsha"

    workspaces {
      name = "dummyterraform"
    }
  }
}


resource "aws_instance" "three" {
  count         =  3
  ami           = "ami-04681163a08179f28"
  instance_type = "t2.medium"

  tags = {
    Name = "mumbai-server"
  }
}
