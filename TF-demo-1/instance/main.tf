/* This comment
is split over multiple lines */
resource "aws_instance" "example" {
  ami           = var.ami_name
  instance_type = var.type
  key_name      = var.key_pair
}