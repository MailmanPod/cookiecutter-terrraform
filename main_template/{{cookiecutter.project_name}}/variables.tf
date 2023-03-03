variable "project_environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "project_repositories" {
  type = list(string)
}

variable "repository_mutability_type" {
  type = string
}

variable "tfstate_bucket_name" {
  type = string
}

variable "tfstate_table_name" {
  type = string
}