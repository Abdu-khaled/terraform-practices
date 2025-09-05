terraform {
  backend "s3" {
    bucket         = "tfstate-abdu"
    key            = "arch2/terraform.tfstate" 
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
