resource "aws_security_group" "sg1" {
    #name = "terraform-sg-ec2"
    name = "terraform-sg"
    description = "Allow ssh and httpd"

    ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        #cidr_blocks = ["0.0.0.0/0"] # This sg is lock for direct internet traffic
        security_groups = [ aws_security_group.sg2.name ] # but can be access throw the the sg having the name (aws_security_group.sg2.name), so the elb (Load balancer)
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags= {
        env = "Dev"
        created-by-terraform="Yes"
    } 
}

resource "aws_security_group" "sg2" {
    name = "terraform-sg-elb" # sg of load balancer
    description = "Allow ssh and httpd"

    ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # Here it is open to traffics comming from internet
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags= {
        env = "Dev"
        creater-by-terraform="Yes"
    } 
}

