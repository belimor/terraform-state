#########################################
# Local Backend Configuration
#########################################
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

#########################################
# S3 Backend Configuration
#########################################
#terraform {
#  backend "s3" {
#    bucket         = "terraform-state-bucket-name"
#    dynamodb_table = "terraform-state-dynamodb-name"
#    encrypt        = true
#    key            = "terraform-state/terraform.tfstate"
#    region         = "us-west-1"
#    profile        = "default"
#  }
#}

