variable "mycidr_block" {
    type = string
    default = "0.0.0.0/0"
  
}

variable "secgrp_ports" {
    type = list

    default = [22]
  
}

variable "securitygroup_name" {
  type = string 
  default = "allow ssh traffic"
}