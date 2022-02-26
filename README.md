# tfmod_vpc

Terraform module to create VPC in AWS using terraform

## Variables

``` terraform
# name: the name of the VPC
# block: the IP allocation for the VPC
# logtype: type of the logs if logflow is enabled. If disabled, this can be an empty string.
# logtype: Valid values: ACCEPT,REJECT, ALL 
# logformat: type of the format of the stored logs.
# logformat: Valid values: plain-text, parquet
# logperhour: Indicates whether to partition the flow log per hour to reduce the AWS cost
variable "example_vpc" { default = { name = "example", block = "10.0.0.0/16", logtype = "ALL", logformat = "parquet", logperhour = true} }
vpc = var.example_vpc

# to enable logflow to comply with AWS recommendation
logflow = true

# ARN of the S3 log bucket
logsbucket = module.s3_logs.arn
```

## Terraform example

``` terraform
######################
# VPC Variables
######################
variable "vpc" { default = { name = "example", block = "10.0.0.0/16", logtype = "ALL", logformat = "parquet", logperhour = true} }

######################
# VPC
######################
module "vpc_main" {
  source = "github.com/virsas/tfmod_vpc"
  vpc  = var.vpc
  logflow = true
  logsbucket = module.s3_logs.arn
}
```
