provider "aws" {
        region = "uap-south-1"
        profile = "configs"
        default_tags {
            tags = {
              name = "aws"
            }
    
        }
}
