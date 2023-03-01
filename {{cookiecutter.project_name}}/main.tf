module "ecr" {
  source                  = "./modules/ecr"
  ecr_project_environment = var.project_environment
  ecr_project_name        = var.project_name
  ecr_repository_names    = var.project_repositories
  ecr_mutability          = var.repository_mutability_type
  ecr_project_tags        = {}
}

module "tfstate" {
  source             = "./modules/tfstate"
  bucket_name        = var.tfstate_bucket_name
  table_name         = var.tfstate_table_name
  state_project_name = var.project_name
  state_project_tags = {}
}
