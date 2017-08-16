resource "aws_s3_bucket" "AppBucket"
  {  bucket = "vpcciadev.appconfig.stanford.edu"
     region = "us-west-2"
     versioning {
          enabled = true
     }
     lifecycle {
          prevent_destroy = false
          }
  }
output "s3_AppConfig_arn" {
  value = "${aws_s3_bucket.AppBucket.arn}"
}
