resource "aws_security_group" "SGBastion" {
  name        = "SG_Bastion_vpcCIADEV"
  description = "Allow SSH inbound traffic from SU Network"
  vpc_id      = "${aws_vpc.vpcCIADEV.id}"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol   = "tcp"
    cidr_blocks = ["171.64.0.0/14"]
  }
  ingress {
    from_port   = 25
    to_port     = 25
    protocol   = "tcp"
    cidr_blocks = ["171.64.0.0/14"]
  }
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol   = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  ingress {
    from_port   = 12489
    to_port     = 12489
    protocol   = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol   = "tcp"
    cidr_blocks = ["24.23.239.35/32"]
  }

  egress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags {
    Name = "SG_Bastion_vpcCIADEV"
    }
}
resource "aws_security_group" "SGWebServer" {
  name        = "SG_WebServer_vpcCIADEV"
  description = "Allow inbound on port http,https and Nagios"
  vpc_id      = "${aws_vpc.vpcCIADEV.id}"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol   = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  ingress {
    from_port   = 12489
    to_port     = 12489
    protocol   = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol   = "tcp"
    cidr_blocks = ["10.2.0.0/16"]
  }

  egress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags {
    Name = "SG_WebServer_vpcCIADEV"
    }
}

resource "aws_security_group" "SGELoadBalance" {
  name        = "SG_ELoadBalance_vpcCIADEV"
  description = "Allow inbound on port http and https"
  vpc_id      = "${aws_vpc.vpcCIADEV.id}"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol   = "tcp"
    cidr_blocks = ["10.2.0.0/16"]
  }

  egress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags {
    Name = "SG_ELoadBalance_vpcCIADEV"
    }
}

resource "aws_security_group" "SGEFSFileSystem" {
  name        = "SG_EFSFileSystem_vpcCIADEV"
  description = "Allow NFS port"
  vpc_id      = "${aws_vpc.vpcCIADEV.id}"
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol   = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  egress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags {
    Name = "SG_EFSFileSystem_vpcCIADEV"
    }
}

resource "aws_security_group" "DBServers" {
  name        = "SG_DBServer_vpcCIADEV"
  description = "Allow connection on DB ports"
  vpc_id      = "${aws_vpc.vpcCIADEV.id}"
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol   = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  ingress {
    from_port   = 1521
    to_port     = 1521
    protocol   = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol   = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol   = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  ingress {
    from_port   = 1521
    to_port     = 1521
    protocol   = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  egress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags {
    Name = "SG_DBServer_vpcCIADEV"
    }
}
