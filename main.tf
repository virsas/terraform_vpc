resource "aws_vpc" "vpc" {
  cidr_block = var.vpc.block
  enable_dns_hostnames = "true"
  tags = {
    Name = var.vpc.name
  }
}

resource "aws_flow_log" "log" {
  count = var.logflow ? 1 : 0

  log_destination_type = "s3"
  log_destination      = var.logsbucket

  traffic_type         = var.vpc.logtype

  vpc_id               = aws_vpc.vpc.id
  destination_options {
    file_format        = var.vpc.logformat
    per_hour_partition = var.vpc.logperhour
  }
}