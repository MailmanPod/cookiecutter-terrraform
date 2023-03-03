locals {
  ecr_repository_prefix = join("-", [var.ecr_project_name, var.ecr_project_environment])
}