###
### EC2 - Elastic IP
###
resource "aws_eip" "elastic-ip" {
  vpc = true
}