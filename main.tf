resource "aws_vpc" "vpcCIADEV" {
  cidr_block = "10.2.0.0/16"
  enable_dns_hostnames = true
  tags {
     Name = "vpcCIADEV"
     }
}

resource "aws_internet_gateway" "igwvpcCIADEV" {
    vpc_id = "${aws_vpc.vpcCIADEV.id}"
}

resource "aws_route_table" "rtblvpcCIADEV" {
    vpc_id = "${aws_vpc.vpcCIADEV.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igwvpcCIADEV.id}"
    }

    tags {
        Name = "RouteTablevpcCIADEV"
    }
}

resource "aws_route_table_association" "vpcCIADEVrbtl" {
    subnet_id = "${aws_subnet.SNZonea.id}"
    route_table_id = "${aws_route_table.rtblvpcCIADEV.id}"
}

resource "aws_route_table_association" "vpcCIADEVrbtlb" {
    subnet_id = "${aws_subnet.SNZoneb.id}"
    route_table_id = "${aws_route_table.rtblvpcCIADEV.id}"
}

resource "aws_route_table_association" "vpcCIADEVrbtlc" {
    subnet_id = "${aws_subnet.SNZonec.id}"
    route_table_id = "${aws_route_table.rtblvpcCIADEV.id}"
}

resource "aws_subnet" "SNZonea" {
  vpc_id     = "${aws_vpc.vpcCIADEV.id}"
  availability_zone = "us-west-2a"
  cidr_block = "10.2.0.0/20"
    tags {
        Name = "vpcCIADEV_Zonea"
    }
}

resource "aws_subnet" "SNZoneb" {
  vpc_id     = "${aws_vpc.vpcCIADEV.id}"
  availability_zone = "us-west-2b"
  cidr_block = "10.2.48.0/20"
    tags {
        Name = "vpcCIADEV_Zoneb"
    }
}
resource "aws_subnet" "SNZonec" {
  vpc_id     = "${aws_vpc.vpcCIADEV.id}"
  availability_zone = "us-west-2c"
  cidr_block = "10.2.96.0/20"
    tags {
        Name = "vpcCIADEV_Zonec"
    }
}

