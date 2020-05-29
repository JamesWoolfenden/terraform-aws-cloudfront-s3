provider "aws" {
  version = "2.64.0"
  region  = "eu-west-1"
  profile = "aws-labs"
}

provider "external" {
  version = "1.2"
}
