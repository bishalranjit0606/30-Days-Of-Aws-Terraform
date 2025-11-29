
terraform {
  required_providers {
    aws = {

      source  = "hashicorp/aws"
  
      version = "~> 6.0" 
    }
  }
}


provider "aws" {
  region = "us-east-1"
}


locals {
 
    bucket_name = "bishal-ranjitkar-testing-bucket" 
    

    environment = "Dev"
}


resource "aws_s3_bucket" "testing-bucket" {
    
    bucket = local.bucket_name

    tags = {

        Environment = local.environment
        name = "${local.bucket_name}-${local.environment}"

 
    }


