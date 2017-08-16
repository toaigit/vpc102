resource "aws_efs_file_system" "myshareEFS" {
  creation_token = "my-share-efs"
  performance_mode = "generalPurpose"
  tags {
    Name = "myshareEFS"
  }
}

resource "aws_efs_mount_target" "alpha" {
  file_system_id = "${aws_efs_file_system.myshareEFS.id}"
  subnet_id      = "${aws_subnet.SNZonea.id}"
}
resource "aws_efs_mount_target" "beta" {
  file_system_id = "${aws_efs_file_system.myshareEFS.id}"
  subnet_id      = "${aws_subnet.SNZoneb.id}"
}
resource "aws_efs_mount_target" "gamma" {
  file_system_id = "${aws_efs_file_system.myshareEFS.id}"
  subnet_id      = "${aws_subnet.SNZonec.id}"
}

output "myshareEFS" {
   value = "${aws_efs_file_system.myshareEFS.id}"
   }
output "myshareEFSDNS" {
   value = "${aws_efs_mount_target.alpha.dns_name}"
   }
