terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

variable "s3_bucketname" {
    default = "bishal_ranjitkar-bucket-us-east-1"
    type = string
}
variable "env" {
    default = "Dev"
    type = string
  
}

resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket = "var.s3_bucketname"

  tags = {
    
    Environment = "var.env"
  }
}

