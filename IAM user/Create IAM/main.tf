resource "aws_iam_user" "myname" {
  name = "myname"
  path = "/"

  tags = {
    tag-key = "tag-value"
  }
}