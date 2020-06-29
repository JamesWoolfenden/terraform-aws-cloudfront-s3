provider "aws" {
  version = "2.64.0"
  region  = "eu-west-1"
}

provider "aws" {
  alias   = "useastone"
  version = "2.64.0"
  region  = "us-east-1"
}

provider "external" {
  version = "1.2"
}
