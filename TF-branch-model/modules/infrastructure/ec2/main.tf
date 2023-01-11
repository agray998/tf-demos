resource "aws_instance" "instances" {
    for_each = {
        public = {subnet = var.public_subnet_id, assign_ip = true},
        private = {subnet = var.private_subnet_id, assign_ip = false}
    }

    ami = var.ami_id
    instance_type = "t2.micro"
    subnet_id = each.value.subnet
    associate_public_ip_address = each.value.assign_ip

    tags = {
        Name = "${var.environment}-${var.region}-${each.key}-ec2"
    }
}