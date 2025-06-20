provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_s3_bucket" "s3_bucket" {
 bucket = "demo-tf-eks-state-bucket_akki19"

 lifecycle {
   prevent_destroy = false
 }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
 name = "tf-eks-state-locks" 
 billing_mode = "PAY_PER_REQUEST"
 hash_key = "LockId"

 attribute {
   name = "LockId"
   type = "S"
 }

} 
