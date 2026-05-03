locals {
  readme_commit = github_repository_file.readme.commit_sha
}

output "readme_commit" {
  value = local.readme_commit
}
