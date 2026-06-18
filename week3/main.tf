provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "app_storage" {
  bucket = "ecommerce-app-storage"
}

resource "aws_s3_bucket_acl" "app_storage_acl" {
  bucket = "ecommerce-app-storage"
  acl    = "public-read"
}

resource "aws_security_group" "app_sg" {
  name = "app-security-group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
