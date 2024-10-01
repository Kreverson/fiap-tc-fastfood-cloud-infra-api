terraform {
  backend "s3" {
    bucket = var.state_file
    key    = "${var.environment}/cloud-infra-api/terraform.tfstate"
    region = var.aws_region
  }
}
