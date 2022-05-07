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
  default = "110828812774.dkr.ecr.us-west-1.amazonaws.com/myapp"
}

variable "SERVICE_NAME" {
  type    = string
  default = "my-app-service"
}

variable "public_subnets" {
  type    = list(any)
  default = [  "subnet-0c44a609dc6dca298",
  "subnet-041bb4e5a6a8f1a9d",]
}

variable "VPC_ID" {
  type    = string
  default = "vpc-0b841dddc07019861"
}

variable "task-name" {
  type    = string
  default = "default-task-name"
}