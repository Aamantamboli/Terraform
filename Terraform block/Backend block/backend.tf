terraform {
    backend "s3" {
      bucket = "terraformbackendblockbucket"
      key    = "Folder/terraform.tfstate"
      region = "ap-south-1"
    }
    
}