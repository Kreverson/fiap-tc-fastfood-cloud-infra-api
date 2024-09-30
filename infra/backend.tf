terraform {
  backend "s3" {
    bucket = "kreverson-us-east-2-terraform-statefile"
    key    = "vpc/terraform.tfstate"
    region = "us-east-2"
  }
}
