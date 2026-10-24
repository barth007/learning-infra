output "instance_id" {
  description = "Survey Builder EC2 instance ID"
  value       = aws_instance.survey_builder.id

}

output "public_ip" {
  description = "Survey Builder public IP address"
  value       = aws_instance.survey_builder.public_ip
}

output "test_instance_id" {
  description = "Survey Builder test EC2 instance ID"
  value       = aws_instance.survey_builder_test.id

}

output "test_public_ip" {
  description = "Survey Builder test EC2 public IP"
  value       = aws_instance.survey_builder_test.public_ip

}