terraform {
  required_providers {
    external = {
      source  = "hashicorp/external"
      version = "2.3.5"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
  required_version = ">=0.14.8"
}
