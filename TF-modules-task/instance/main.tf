resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.machine_type
  key_name      = var.key_name
}