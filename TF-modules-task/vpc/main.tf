resource "aws_vpc" "example_vpc" {
    cidr_block = var.vpc_cidr
}

resource "aws_subnet" "example_subnet" {
    depends_on = [
      aws_vpc.example_vpc
    ]
    vpc_id = aws_vpc.example_vpc.id
    cidr_block = "100.0.0.0/24"
}