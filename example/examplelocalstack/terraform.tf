terraform {
  required_providers {
    aws = {
      version = "4.6.0"
      source  = "hashicorp/aws"
    }
    external = {
      version = "2.0.0"
    }
  }
}
