# Security group for general use; allow SSH and a custom app port 3500 (as your notes used port 3500)
resource "aws_security_group" "app_sg" {
  name        = "${var.project}-sg"
  description = "Allow SSH and app port 3500"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "App port 3500"
    from_port   = 3500
    to_port     = 3500
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-sg"
  }
}

