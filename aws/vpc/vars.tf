variable "network_cidr" {
  type    = string
  default = "10.10.0.0/24"
}

variable "project_network" {
  type    = string
  default = "My Network"
}

variable "public_subnets" {

  type = list
  default = ["10.10.10.0/25"]
  
}

variable "private_subnets" {

    type = list
    default = ["10.10.10.128/25"]
  
}

variable "availability_zones" {
  
  type = list
  default = ["us-west-1a", "us-west-1c", "us-west-1a","us-west-1c"]
}
