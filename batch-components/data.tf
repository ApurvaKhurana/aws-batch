# fetch details of the default vpc
resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_default_vpc.default_vpc.id]
  }
}

# fetch details of the default security group
resource "aws_default_security_group" "default_security_group" {
  vpc_id = aws_default_vpc.default_vpc.id

}