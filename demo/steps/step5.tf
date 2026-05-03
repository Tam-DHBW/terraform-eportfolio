resource "github_release" "one_dot_o" {
  repository       = github_repository.live_demo.name
  tag_name         = "v1.0.0"
  target_commitish = local.readme_commit
  draft            = false
  prerelease       = false
}
