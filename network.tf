
data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_vpc" "sftpVPC" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  instance_tenancy = "default"
  tags = {
    Name = "sftpVPC"
  }
}

resource "aws_subnet" "sftpSubnet1" {
  vpc_id     = aws_vpc.sftpVPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone_id = data.aws_availability_zones.available.zone_ids[0]
  tags = {
    Name = "sftpSubnet1"
  }
}

resource "aws_subnet" "sftpSubnet2" {
  vpc_id     = aws_vpc.sftpVPC.id
  cidr_block = "10.0.2.0/24"
  availability_zone_id = data.aws_availability_zones.available.zone_ids[1]
  tags = {
    Name = "sftpSubnet2"
  }
}

resource "aws_internet_gateway" "sftpIGW" {
  vpc_id = aws_vpc.sftpVPC.id
  tags = {
    Name = "sftpIGW"
  }
}

resource "aws_route_table" "sftpRouteTable" {
  vpc_id = aws_vpc.sftpVPC.id  
  tags = {
    Name = "sftpRouteTable"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sftpSubnet1.id
  route_table_id = aws_route_table.sftpRouteTable.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.sftpSubnet2.id
  route_table_id = aws_route_table.sftpRouteTable.id
}

resource "aws_route" "r" {
  route_table_id         = aws_route_table.sftpRouteTable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.sftpIGW.id
}

resource "aws_eip" "sftpEIP1" {
  vpc = true
  depends_on                = [aws_internet_gateway.sftpIGW]
}

resource "aws_eip" "sftpEIP2" {
  vpc = true
  depends_on                = [aws_internet_gateway.sftpIGW]
}

resource "aws_security_group" "sftpSG" {
  description = "Control SFTP inbound traffic"
  vpc_id      = aws_vpc.sftpVPC.id
  tags = {
    Name = "sftpSG"
  }
}

resource "aws_security_group_rule" "sftpegress" {
  type              = "egress"
  to_port           = 0
  from_port         = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sftpSG.id
}