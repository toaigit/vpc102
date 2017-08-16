resource "aws_s3_bucket_object" "configtarball" {
    bucket = "${aws_s3_bucket.AppBucket.id}"
    key = "ec2config.tar"
    source = "ec2config.tar"
}
