terraform {
  required_providers {
    aws = {
      version = "3.2.0"
      source  = "hashicorp/aws"
    }
    external = {
      version = "1.2"
    }
  }
}
