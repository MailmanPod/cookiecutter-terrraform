project_environment        = "{{cookiecutter.environment}}"
project_name               = "{{cookiecutter.project_name}}"
project_repositories       = [{% for repo_name in cookiecutter.repository.names %}"{{ repo_name }}",{% endfor %}]
repository_mutability_type = "{{cookiecutter.repository.type}}"
tfstate_bucket_name        = "{{cookiecutter.state.bucket}}"
tfstate_table_name         = "{{cookiecutter.state.lock}}"