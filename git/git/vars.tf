variable "GITHUB_TOKEN" {
}

variable "name" {
  type = string
  default = ""
}

variable "visibility" {
  type = string
  default = "public"
}

variable "description" {
  type = string
  default = ""
}

variable "gitignoreTemplate" {
    type = string
    default = ""
}