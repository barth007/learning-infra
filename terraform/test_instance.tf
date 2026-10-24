resource "aws_instance" "survey_builder_test" {
  ami                         = var.aws_ami
  instance_type               = var.instance_type
  key_name                    = "barth-aws-dev"
  subnet_id                   = data.aws_subnet.existing.id
  vpc_security_group_ids      = [aws_security_group.survey_builder.id]
  associate_public_ip_address = true

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = "survey-builder-test"
    Environment = "test"
    ManagedBy   = "Terraform"
  }

}
