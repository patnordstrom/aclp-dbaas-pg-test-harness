terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 2.23"
    }
  }

  required_version = ">= 1.7"
}