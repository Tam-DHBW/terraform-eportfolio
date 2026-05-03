terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.12.1"
    }
  }
}

variable "github_token" {}

provider "github" {
  token = var.github_token
}
