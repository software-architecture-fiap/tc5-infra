provider "aws" {
  alias  = "us_east"
  region = "us-east-1"
}

resource "aws_s3_bucket" "repo-videos" {
  provider      = aws.us_east
  bucket        = "repo-videos-upload"
  force_destroy = true
}

resource "aws_s3_bucket" "repo-frame-images" {
  provider      = aws.us_east
  bucket        = "repo-frame-images"
  force_destroy = true
}
