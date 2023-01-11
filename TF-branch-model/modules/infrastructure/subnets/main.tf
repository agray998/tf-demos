variable "subnet_map" {
    default = {
        public = 1,
        private = 2
    }
}

resource "aws_subnet" "subnets" {
    for_each = var.subnet_map
    vpc_id = var.vpc_id
    cidr_block = cidrsubnet("100.0.0.0/16", 8, each.value)

    tags = {
        Name = "${var.region}-${var.environment}-${each.key}-subnet"
    }
}
