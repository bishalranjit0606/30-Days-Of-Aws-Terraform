terraform {

  backend "s3" {
    bucket = "terraform-tf-state-bishal"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true

  }

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


resource "aws_s3_bucket" "first_bucket" {
  bucket = "bishal-ranjitkar-bucket-2025"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  versioning {
    enabled = true
  }
}

# 🔑 Correct resource for Server-Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_config" {
  bucket = aws_s3_bucket.first_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      # Use AES256 for S3-managed keys
      sse_algorithm = "AES256" 
    }
  }
}