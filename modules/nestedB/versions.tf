terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 4.24.1"
    }
  }

  required_version = ">= 0.14.11"
}
