variable "network_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "project_network" {
  type    = string
  default = "My Network"
}

variable "subnet_public_network" {
  type    = string
  default = "10.10.1.0/24"

}

variable "availabilityzone_a" {
  type    = string
  default = "us-east-1"
}

variable "subnet_private_network" {
  type    = string
  default = "10.10.2.0/24"

}

variable "availabilityzone_b" {
  type    = string
  default = "us-west-1"
}
