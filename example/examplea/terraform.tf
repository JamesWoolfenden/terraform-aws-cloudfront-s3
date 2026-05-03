terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.3.5"
    }
  }
  required_version = ">=0.14.8"
}
