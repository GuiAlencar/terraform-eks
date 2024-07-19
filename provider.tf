terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.42.0"
    }
  }

  backend "s3" {
    bucket = "comunidadedevops"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"

    default_tags {
        tags = {
            owner = "guilherme"
            managed-by = "terraform" 
        }
    }
}