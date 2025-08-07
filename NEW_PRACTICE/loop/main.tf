resource "aws_instance" "loop_ec2" {
    count
    ami = "ami-08a6efd148b1f7504"
    instance_type = "t2.micro"
    key_name = "New-Virgi-key"
    tags = {
      Name = "instance-${value}"
      Env = terraform.workspace
    }
  
}