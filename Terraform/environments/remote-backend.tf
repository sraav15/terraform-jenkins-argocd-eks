terraform {
  backend "s3" {
    bucket = "my-sample-springbootapps3"
    key    = "path/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking"
  }
}