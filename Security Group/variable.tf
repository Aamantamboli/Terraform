variable "this_aws_security_group" {
    type = list 
    default = ["awssecuritygroup" , "22" , "80" , "tcp"]
    description = "This variable is for aws security group"
}
