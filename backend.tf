terraform {
  backend "s3" {
    bucket         = "terraformstatefile090909"
    key            = "module-ec2.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
