provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  alias  = "useastone"
  region = "us-east-1"
}
