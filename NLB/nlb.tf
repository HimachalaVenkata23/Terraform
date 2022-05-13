resource "aws_vpc" "main"{
cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "gw" {
vpc_id = aws_vpc.main.id

}
resource "aws_subnet" "examplea"{
vpc_id = aws_vpc.main.id
cidr_block = "10.0.1.0/24"
availability_zone = "us-east-1a"
}

resource "aws_subnet" "exampleb"{
vpc_id = aws_vpc.main.id
cidr_block = "10.0.0.0/24"
availability_zone = "us-east-1b"
}

resource "aws_lb" "test" {
  name               = "test-nlb-tf"
  internal           = false
  load_balancer_type = "network"
  #security_groups    = [aws_security_group.sg.id]
  subnets            = [aws_subnet.examplea.id, aws_subnet.exampleb.id]
  enable_deletion_protection = true

tags = {
    Environment = "production"
  }
}