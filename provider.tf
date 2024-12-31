terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.37.1"
    }
  }
}

#Non Prod
provider "newrelic" {
  account_id = var.account_id_non_prod
  api_key    = var.account_api_key_non_prod
  region     = var.account_region_non_prod
}

## NON PROD ACCOUNT CREDENTIALS

variable "account_id_non_prod" {
  type = any
}

variable "account_api_key_non_prod" {
  type = any
}

variable "account_region_non_prod" {
  type = any
}