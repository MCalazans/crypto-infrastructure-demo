resource "aws_security_group" {
    
}

resource "aws_instance" "example" {
    ami           = "ami-009d6802948d06e52"
    instance_type = "t2.micro"
}