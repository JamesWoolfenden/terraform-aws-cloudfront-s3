terraform {
  required_providers {
    aws = {
      version = "3.8.0"
      source  = "hashicorp/aws"
    }
    external = {
      version = "1.2"
    }
  }
}
