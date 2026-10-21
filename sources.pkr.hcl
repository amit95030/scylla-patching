
source "amazon-ebs" "rhel" {
  region        = var.aws_region
  instance_type = var.instance_type
  ssh_username  = "ec2-user"

  ami_name        = "scylla-patching-rhel9-{{timestamp}}"
  ami_description = "Custom RHEL 9 AMI for OS patching and ScyllaDB"

  source_ami_filter {
    filters = {
      name                = "RHEL-9.6.0_HVM-*-x86_64-*-Hourly2-GP3"
      architecture        = "x86_64"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }

    owners      = ["309956199498"]
    most_recent = true
  }
}