terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "wolf"

    workspaces {
      name = "terraform-aws-cloidfront-s3-exampleA"
    }
  }
}
