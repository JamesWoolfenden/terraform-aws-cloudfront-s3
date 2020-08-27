provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  alias  = "useastone"
  region = "us-east-1"
}
