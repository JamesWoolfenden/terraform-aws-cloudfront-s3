resource "aws_s3_bucket_policy" "cloudfront" {
  bucket = var.bucket_name
  policy = data.aws_iam_policy_document.cloudfront.json
}
