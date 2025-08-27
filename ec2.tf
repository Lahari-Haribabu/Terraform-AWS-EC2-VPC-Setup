#key pair
resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}
#vpc
resource "aws_default_vpc" "default" {

}
#security groups
resource "aws_security_group" "my_security_group" {
  name        = "automate-sg"
  description = "this is sg for tf"
  vpc_id      = aws_default_vpc.default.id

  # inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "automate-sg"
  }
}
#configure aws instance
resource "aws_instance" "my_instance" {
  for_each = tomap({
    lucky = "t2.large"
  })

  depends_on = [ aws_security_group.my_security_group, aws_key_pair.my_key ]
  ami           = var.ec2_ami_id
  instance_type = each.value # you need to specify instance type
  key_name      = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  user_data = file("install_nginx.sh")

  root_block_device {
    volume_size = var.env == "prd" ? 20 : var.ec2_default_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = each.key
    Environment = var.env
  }
}
