<!--font_size: 3-->
<!--jump_to_middle-->
Hands-On Live Demo
===
<!--end_slide-->

Demo Goals
===

<!--alignment: center-->

- Install Terraform
- Initialize GitHub provider
- Create GitHub Repo
- Obtain the default branch
- Commit a README
- Obtain the commit hash
- Publish a release
- Disaster recovery
- Tear down deployment

<!--end_slide-->

Setting up
===

<!--column_layout: [1, 1]-->
<!--column: 0-->

# Required tools
## Terraform
```bash
# Windows
winget install HashiCorp.Terraform 

# MacOS
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Linux
sudo pacman -S terraform    # Arch
nix shell nixpkgs#terraform # Nix
```

<!--column: 1-->
# Github
- Personal Access Token
    - https://github.com/settings/tokens/new
- Permissions
    - `repo`
        - Full access
    - `delete_repo`


<!--end_slide-->

Provider Setup
===

<!--column_layout: [1, 1]-->
<!--column: 0-->

# Configuring the provider

<!--alignment: center-->
## demo.tf
```terraform
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.12.1"
    }
  }
}

variable "github_token" {}

provider "github" {
  token = var.github_token
}
```

## auth.auto.tfvars
```terraform +line_numbers
github_token = "<your github access token>"
```
<!--alignment: left-->

<!--column: 1-->

# Initializing Terraform

```bash +exec:tf
/// ./configure-steps.sh 1
terraform init
```

<!--end_slide-->
<!--skip_slide-->

The files have to be created in the working directory that you are running Terraform from!

If you are getting errors from the GitHub API, you most likely chose the incorrect access token permissions


<!--end_slide-->

Creating a repository
===

# Define repository

<!--alignment: center-->
## demo.tf
```terraform
resource "github_repository" "live_demo" {
  name        = "terraform-live-demo"
  description = "Terraform-managed Repo"
  visibility  = "public"
  auto_init   = true
}
```
<!--alignment: left-->

---

# Apply changes

```bash +exec:tf +acquire_terminal
/// ./configure-steps.sh 2
terraform apply
```

<!--end_slide-->
<!--skip_slide-->

Make sure to choose a repository name, which does not exist yet on your account!

Without `auto_init`, no default branch and root commit will be created!

<!--end_slide-->

Adding a README
===

# Obtain default branch and define file

<!--alignment: center-->
## demo.tf
```terraform
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
```
<!--alignment: left-->

---

# Apply changes

```bash +exec:tf +acquire_terminal
/// ./configure-steps.sh 3
terraform apply
```

<!--end_slide-->

Obtaining the commit hash
===

# Defining locals and outputs

<!--alignment: center-->
## demo.tf
```terraform
locals {
  readme_commit = github_repository_file.readme.commit_sha
}

output "readme_commit" {
  value = local.readme_commit
}
```
<!--alignment: left-->

---

# Apply changes and view outputs

```bash +exec:tf +acquire_terminal
/// ./configure-steps.sh 4
terraform apply
```

# View current outputs

```bash
terraform output
```

<!--end_slide-->

Publishing a release
===

# Declaring the release

<!--alignment: center-->
## demo.tf
```terraform
resource "github_release" "one_dot_o" {
  repository       = github_repository.live_demo.name
  tag_name         = "v1.0.0"
  target_commitish = local.readme_commit
  draft            = false
  prerelease       = false
}
```
<!--alignment: left-->

---

# Apply changes

```bash +exec:tf +acquire_terminal
/// ./configure-steps.sh 5
terraform apply
```

<!--end_slide-->
<!--skip_slide-->

The `draft` and `prerelease` options have to be provided, otherwise it will not be a proper stable release!

<!--end_slide-->

Disaster recovery
===

# Example scenario
Greg the intern deleted super important 1.0 release

- Our multi million dollar SaaS is down
- Customers furious
- 30 missed calls from boss

---

# Repair infrastructure

```bash +exec:tf +acquire_terminal
/// ./configure-steps.sh 5
terraform apply
```

<!--end_slide-->
<!--skip_slide-->

You are free to delete more things than just the release. Terraform will take care of it!

<!--end_slide-->

Tear Down Infrastructure
===

# Deleting all resources

```bash +exec:tf +acquire_terminal
/// ./configure-steps.sh 5
terraform apply -destroy
```

<!--end_slide-->

<!--jump_to_middle-->
Thank You For Participating!
===

<!--
vim: backupcopy=yes
-->
