terraform {

  backend "s3" {
    bucket  = "okletscreateabucket"
    key     = "aws-batch/batch-components"
    region  = "us-east-1"
    encrypt = true
  }

  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.35"
    }
  }
}