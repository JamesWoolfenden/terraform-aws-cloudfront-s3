terraform {
  required_providers {
    external = {
      version = "2.0.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
}
