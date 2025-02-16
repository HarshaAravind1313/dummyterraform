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
  count         = 1  # Reduced from 3 to 1 to avoid vCPU limit issues
  ami           = "ami-04681163a08179f28"
  instance_type = "t2.micro"  # Changed from t2.medium to avoid vCPU quota issues

  tags = {
    Name = "mumbai-server"
  }
}
