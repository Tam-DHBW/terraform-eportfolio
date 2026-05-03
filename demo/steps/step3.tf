data "github_repository" "live_demo" {
  name = github_repository.live_demo.name
}

resource "github_repository_file" "readme" {
  repository          = github_repository.live_demo.name
  branch              = data.github_repository.live_demo.default_branch
  file                = "README.md"
  content             = "# Hello from Terraform"
  overwrite_on_create = true
}
