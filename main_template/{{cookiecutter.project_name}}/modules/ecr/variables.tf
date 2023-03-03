variable "ecr_project_name" {
  type = string
}

variable "ecr_project_environment" {
  type = string
}

variable "ecr_repository_names" {
  type = list(string)
}

variable "ecr_mutability" {
  type = string
}

variable "ecr_project_tags" {
  type = map(string)
}