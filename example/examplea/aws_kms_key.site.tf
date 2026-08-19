resource "aws_kms_key" "site" {

  enable_key_rotation     = true
  deletion_window_in_days = 7
}
