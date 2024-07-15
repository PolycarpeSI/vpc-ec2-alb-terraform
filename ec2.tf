resource "aws_instance" "Server1" {
    ami ="ami-0b72821e2f351e396" 
    instance_type = "t2.micro"
    vpc_security_group_ids = [ aws_security_group.sg1.id ]
    availability_zone = "us-east-1a"
    subnet_id = aws_subnet.private1.id
    user_data = file("code.sh")
    tags = {
      Name="webserser-1"
    }
}

resource "aws_instance" "Server2" {
    ami = "ami-0b72821e2f351e396"
    instance_type = "t2.micro"
    vpc_security_group_ids = [ aws_security_group.sg1.id ]
    availability_zone = "us-east-1a"
    subnet_id = aws_subnet.private2.id
    user_data = file("code.sh")
    tags = {
      Name="webserser-2"
    }
}