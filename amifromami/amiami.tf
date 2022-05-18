# creating an ec2 instance from ami created by Teju  ami-0b3366a0abf37f997

resource "aws_instance" "my-first-server" {
  ami           = "ami-0b3366a0abf37f997"
  instance_type = "t2.micro"

}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1e"
  size              = 40
  tags = {
    Name = "HelloWorld"
  }
}
resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id = aws_ebs_volume.example.id
  tags = {
    Name = "HelloWorld_snap"
  }
}
resource "aws_ami" "example" {
  name                = "exaple-terraform"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"
  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = aws_ebs_snapshot.example_snapshot.id
    volume_size = 100
  }
}