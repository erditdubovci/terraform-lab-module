module "user-erdit-module" {
  source  = "app.terraform.io/erditdubovci/user-erdit-module/iam"
  version = "1.0.2"
  # insert required variables here

  user_name = "erdit-user"
  policy_name = "erdit-policy"
  policy_document = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*", "iam:GetAccountPasswordPolicy", "elasticloadbalancing:DescribeLoadBalancers"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "iam:ChangePassword"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  }
}
