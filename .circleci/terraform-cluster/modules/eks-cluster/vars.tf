variable "pub_subnets" {
    type = list(string)
}
variable "priv_subnets" {
    type = list(string)
}

variable "key_name" {
    type = string
}

variable "priv_subnet_id_1"{ 
  type = string 
  }

variable "priv_subnet_id_2"{ type = string }
variable "pub_subnet_id_1"{ type = string }
variable "pub_subnet_id_2"{ type = string }

variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
  default = "dev-test"
}
variable "proj-tag" {
    type = map(string)
    default = {
      Terraform   = "true"
      Environment = "dev-test"
  }
}
variable "availability_zones" {
    type = list(string)
}