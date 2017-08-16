#  Create VPC, subnet, sg, efs, s3 with terraform
 main.tf   		create vpc, subnets
 sg.tf     		create security groups
 AppConfigS3Bucket.tf   create S3 Bucket for Application Configuration
 tfstateS3Bucket.tf     create S3 Bucket for Terraform State file
 S3Upload.tf            Example on how to upload file to S3 Bucket
 backend.tf.save        Sample of storing statefile to the S3
