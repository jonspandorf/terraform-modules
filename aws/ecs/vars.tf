variable "CLUSTER_NAME" {
  type    = string
  default = "my-cluster"
}

variable "LB_NAME" {
  type    = string
  default = "app-loadbalancer"
}

variable "MYREPO" {
  type    = string
  default = "110828812774.dkr.ecr.us-west-1.amazonaws.com/jenkins-ecr-test"
}

variable "SERVICE_NAME" {
  type    = string
  default = "my-app-service"
}

variable "PUBLIC_SUBNETS" {
  type    = list(any)
  default = []
}

variable "VPC_ID" {
}

variable "task-name" {
  type    = string
  default = "default-task-name"
}

variable "BUILD_NUMBER" {
  type    = string 
  default = "1"
}