variable "aws_region" {
  description = "AWS region containing the Survey Builder infrastructure"
  type        = string
  default     = "eu-central-1"

}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "aws_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0303e2e4a29f041a3"
}
variable "volume_size" {
  description = "Root volume size for the EC2 instance"
  type        = number
  default     = 8
}
variable "volume_type" {
  description = "Root volume type for the EC2 instance"
  type        = string
  default     = "gp3"
}