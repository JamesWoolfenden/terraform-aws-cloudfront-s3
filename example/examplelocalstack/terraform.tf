terraform {
  required_providers {
    aws = {
      version = "3.71.0"
      source  = "hashicorp/aws"
    }
    external = {
      version = "2.0.0"
    }
  }
}
