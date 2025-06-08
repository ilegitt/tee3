# IAM Role Setup for GitHub OIDC

Steps:
1. Add OpenID Connect provider:
   - URL: https://token.actions.githubusercontent.com
   - Audience: sts.amazonaws.com
2. Create IAM role with trust policy allowing:
   "token.actions.githubusercontent.com:sub": "repo:<owner>/<repo_name>:ref:refs/heads/main"
3. Attach appropriate permissions.
4. Add AWS_ROLE_ARN and AWS_REGION secrets to GitHub.
