resource "aws_s3_bucket" "boundary_session_recording" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = var.s3_bucket_name_tags
    Environment = var.s3_bucket_env_tags
    Terraform   = "true"
  }
}

# resource "aws_s3_bucket_acl" "s3_acl" {
#   bucket = aws_s3_bucket.boundary_session_recording.id
#   acl    = "private"
# }

resource "aws_s3_bucket_versioning" "versioning_demo" {
  bucket = aws_s3_bucket.boundary_session_recording.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_metric" "demo-bucket-metric" {
  bucket = aws_s3_bucket.boundary_session_recording.id
  name   = "EntireBucket"
}

# data "aws_iam_policy_document" "topic" {
#   statement {
#     effect = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["s3.amazonaws.com"]
#     }

#     actions   = ["SNS:Publish"]
#     resources = ["arn:aws:sns:*:*:s3-event-notification-topic"]

#     condition {
#       test     = "ArnLike"
#       variable = "aws:SourceArn"
#       values   = [aws_s3_bucket.boundary_session_recording.arn]
#     }
#   }
# }
# resource "aws_sns_topic" "topic" {
#   name   = "s3-event-notification-topic"
#   policy = data.aws_iam_policy_document.topic.json
# }

# resource "aws_s3_bucket_notification" "bucket_notification" {
#   bucket = aws_s3_bucket.boundary_session_recording.id

#   topic {
#     topic_arn     = aws_sns_topic.topic.arn
#     events        = ["s3:ObjectCreated:*"]
#     filter_suffix = ".log"
#   }
# }