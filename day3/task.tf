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

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MyVPC"
  }
}

resource "aws_s3_bucket" "first_bucket" {
  bucket = "bishal-ranjitkar-bucket-2025"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    VPC_ID      = aws_vpc.my_vpc.id 
  }
}

