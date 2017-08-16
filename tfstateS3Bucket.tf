resource "aws_s3_bucket" "remotestate"
  {  bucket = "vpcciadev.remotestate.stanford.edu"
     region = "us-west-2"
     versioning {
          enabled = true
     }
     lifecycle {
          prevent_destroy = false
          }
  }
output "s3_remotestate_arn" {
  value = "${aws_s3_bucket.remotestate.arn}"
}
