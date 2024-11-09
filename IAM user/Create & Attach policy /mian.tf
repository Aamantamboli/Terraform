resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      = jsonencode{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.myname.name
  policy_arn = aws_iam_policy.policy.arn
}