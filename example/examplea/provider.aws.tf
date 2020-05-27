provider "aws" {
  region  = "eu-west-1"
  version = "2.61"
  profile = "aws-labs"
}

provider "external" {
  version = "1.2"
}
