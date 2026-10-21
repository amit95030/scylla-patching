variable "aws_region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS region for the Packer build"
}

variable "instance_type" {
  type        = string
  default     = "t3.medium"
  description = "Temporary EC2 instance type used by Packer"
}

variable "patch_os" {
  type        = bool
  default     = true
  description = "Whether to apply operating system updates to RHEL during the AMI build"
}

variable "scylla_version" {
  type        = string
  default     = "2026.3"
  description = "ScyllaDB version to install"
}