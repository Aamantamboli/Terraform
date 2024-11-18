provider "aws" {
        region = "ap-south-1"
        profile = "configs"
        default_tags {
            tags = {
              name = "aws"
            }
    
        }
}
