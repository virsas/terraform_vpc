variable "region" { default = "eu-west-1" }
variable "vpc" { default = { name = "exaple", block = "10.0.0.0/16", logtype = "ALL", logformat = "plain-text", logperhour = true} }
variable "logflow" { default = false }
variable "logsbucket" { default = "" }
