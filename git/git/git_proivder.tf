terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.25.0-alpha"
    }
  }
}

provider "github" {
  token = var.GITHUB_TOKEN

}