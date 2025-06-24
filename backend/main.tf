provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_s3_bucket" "s3_bucket" {
 bucket = "demo-tf-eks-state-bucket-akki19"
 force_destroy = true
 lifecycle {
   prevent_destroy = false
 }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
 name = "tf-eks-state-locks" 
 billing_mode = "PAY_PER_REQUEST"
 hash_key = "LockID"

 attribute {
   name = "LockID"
   type = "S"
 }
tags = {
    Name        = "Terraform Lock Table"
    Environment = "Dev"
  }
} 
