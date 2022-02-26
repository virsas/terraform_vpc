output "id" {
  value = aws_vpc.vpc.id
}

output "arn" {
  value = aws_vpc.vpc.arn
}

output "flow_id" {
  value = aws_flow_log.log.*.id
}

output "flow_arn" {
  value = aws_flow_log.log.*.arn
}
