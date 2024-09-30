terraform {
  backend "s3" {
    bucket = var.state_file
    key    = "${var.environment}/vpc/terraform.tfstate"
    region = var.aws_region
  }
}
