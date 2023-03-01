resource "aws_ecr_repository" "this" {
  for_each = { for repo in var.ecr_repository_names : format("%s-%s", local.ecr_repository_prefix, repo) => repo }

  name                 = each.value
  image_tag_mutability = var.ecr_mutability

  tags = merge(
    {
      Name        = each.value
      description = "ECR registry created"
      managed-by  = "Terraform"
      creator     = "tarmac-internal"
    },
    var.ecr_project_tags
  )
}