provider "aws" {
  region = "ap-south-1"  # You can change this to your desired AWS region
}

resource "aws_iam_user" "example_user" {
  name = "example_user"
}

# Define an S3 policy that grants permissions to the user
resource "aws_iam_policy" "s3_policy" {
  name        = "example_s3_policy"
  description = "A policy granting access to S3"

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action   = "s3:*"
        Effect   = "Allow"
        Resource = "arn:aws:s3:::bucketversion/*"  # Replace with your bucket name
      }
    ]
  })
}

# Attach the S3 policy to the user
resource "aws_iam_policy_attachment" "example_policy_attachment" {
  name       = "example_s3_policy_attachment"
  users      = [aws_iam_user.example_user.name]
  policy_arn = aws_iam_policy.s3_policy.arn
}
