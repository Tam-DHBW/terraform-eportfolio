resource "github_repository" "live_demo" {
  name        = "terraform-live-demo"
  description = "Terraform-managed Repo"
  visibility  = "public"
  auto_init   = true
}
