terraform {
  required_providers {
    aws = {
      version = "3.31.0"
      source  = "hashicorp/aws"
    }
    external = {
      version = "2.0.0"
      source  = "hashicorp/external"
    }
  }
  required_version = ">= 0.14"
}
