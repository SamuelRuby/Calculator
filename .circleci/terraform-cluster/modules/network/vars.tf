variable "availability_zones" {
    type = list(string)
}
variable "main_vpc_cidr" {}
variable "public_subnets" {
    type = list(string)
}
variable "private_subnets" {
    type = list(string)
}
variable "destination_cidr_block" {}
variable "namespace" {
    type = string
    description = "(optional) describe your variable"
    default = "dev-test"
}
variable "proj-tag" {
  description = "Tags to apply to resources created by this module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev-test"
  }
}
