variable "PATH_TO_KEY" {
}

variable "PATH_TO_PRIVATE" {

}

variable "instance_ami" {
  type    = string
  default = "ami-02541b8af977f6cdd"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "remote-exec_commands" {
  type    = list(any)
  default = []
}

variable "sshuser" {

  type    = string
  default = "ec2-user"

}

variable "public_subnet_id" {
  type    = string
  default = ""
}

variable "keyname" {
  type    = string
  default = "nonvalidkeyname"

}

variable "shouldRemoteExec" {

  type    = bool
  default = false
}

variable "securitygroup_id" {
  type    = string
  default = "securitygroupidhere"
}