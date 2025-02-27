resource "aws_security_group" "devops_project_veera" {
  name        = "devops_project_veera"
  description = "Security group for DevOps project"

  ingress {
    description = "SSH access from office network"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.0.114.0/24"]  # Replace with your IP
  }

  ingress {
    description = "HTTP access for public users"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Public access
  }

  ingress {
    description = "HTTPS access for public users"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Public access
  }

  ingress {
    description = "App access from internal VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Replace with your VPC CIDR
  }

  ingress {
    description = "SonarQube or Jenkins access (Restrict to VPN or internal network)"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["192.168.2.0/24"]  # Replace with your VPN subnet
  }

  # Egress rule (allows all outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops_project_veera"
  }
}