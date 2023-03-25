terraform {
    backend "s3" {
        # Bucket name
        bucket = "royalboe-terraform"
        key = "royalboe/terraform/terraform.tfstate"
        region = "us-east-1"

        # DynamoDB table name
        dynamodb_table = "terraform-test-locks"
        encrypt = true
      
    }
}