#Create a user
resource "aws_iam_user" "myname" {
  name = "myname"
  path = "/"

  tags = {
    tag-key = "tag-value"
  }
}

#Create a policy
resource "aws_iam_policy" "s3_read_only_policy" {
  name        = "S3ReadOnlyPolicy"
  description = "Policy for read-only access to a specific S3 bucket"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:ListBucket",
          "s3:GetObject"
        ]
        Resource = [
          "arn:aws:s3:::my-bucket",          # Bucket-level permissions
          "arn:aws:s3:::my-bucket/*"        # Object-level permissions within the bucket
        ]
      }
    ]
  })
}

#Attach a policy to user
resource "aws_iam_user_policy_attachment" "attach_s3_policy" {
  user       = aws_iam_user.my_user.name
  policy_arn = aws_iam_policy.s3_read_only_policy.arn
}
