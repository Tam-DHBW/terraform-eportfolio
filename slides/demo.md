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
```file +line_numbers {1-8|12-14|10|all}
path: ../demo/steps/step1.tf
language: terraform
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

Creating a repository
===

# Define repository

<!--alignment: center-->
## demo.tf
```file +line_numbers
path: ../demo/steps/step2.tf
language: terraform
```
<!--alignment: left-->

---

# Apply changes

```bash +exec:tf +acquire_terminal
/// ./configure-steps.sh 2
terraform apply
```

<!--end_slide-->

Adding a README
===

# Obtain default branch and define file

<!--alignment: center-->
## demo.tf
```file +line_numbers {1-3|5-11|all}
path: ../demo/steps/step3.tf
language: terraform
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
```file +line_numbers {1-3|5-7|all}
path: ../demo/steps/step4.tf
language: terraform
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
```file +line_numbers
path: ../demo/steps/step5.tf
language: terraform
```
<!--alignment: left-->

---

# Apply changes

```bash +exec:tf +acquire_terminal
/// ./configure-steps.sh 5
terraform apply
```

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
