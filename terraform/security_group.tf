

resource "aws_security_group" "survey_builder" {
  name        = "survey-builder-sg"
  description = "launch-wizard-1 created 2026-10-06T09:31:48.031Z"
  vpc_id      = data.aws_vpc.existing.id

  ingress {
    description = null
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = null
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["102.91.133.92/32"]
  }
  ingress {
    description = null
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}