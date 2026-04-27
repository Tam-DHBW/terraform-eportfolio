---
title: Introduction to Terraform
event: Software Engineering 2025-2026
theme: 
    name: catppuccin-macchiato
    override:
        footer:
            style: template
            height: 4
            left:
                image: terraform-logo.png
            center: "{title}  /    Tam-DHBW/terraform-eportfolio"

---


The Cloud
===

# The Cloud Is **Everywhere**
---
<!--incremental_lists: true-->
<!--column_layout: [9, 1, 2, 1]-->
<!--column: 2-->

![](./logos/aws.png)
![](./logos/azure.png)
![](./logos/gcp.png)

<!--column: 0-->

## The Numbers
- ~9/10 organizations are using the cloud[^1]
- ~7/10 use more than one [^1]
- Half pursuing cloud-first strategy[^1]
- Cloud market worth **>$900B+**[^2]

---

## Why Cloud?
- Pay as you go
- Scale up or down in minutes
- Deploy for the whole globe
- Reduced operational burden

<!--reset_layout-->

<!--end_slide-->

Building In The Cloud
===
<!--incremental_lists: true-->

<!--alignment: center-->
<!--column_layout: [2, 2, 2, 3, 2, 2, 2]-->
<!--include: ./complexity-aws.md-->
<!--pause-->
<!--column: 3-->
> &nbsp;
> What about a
> hybrid cloud?
> &nbsp;
<!--pause-->
<!--include: ./complexity-azure.md-->
<!--include: ./complexity-dots.md-->
<!--reset_layout-->
<!--alignment: left-->
<!--pause-->

<!--column_layout: [1, 1]-->
<!--column: 0-->
## Furthermore
- Each provider has its own
    - API
    - CLI
    - Console
- Reproducibility?
- Version control??
- Disaster recovery???
- Oversight????
- ...
- ...
- ...

<!--font_size: 1-->
<!--column: 1-->
##  You 󰗹 *(probably)* 
- ***"WHOAH!"***
- *"I dont like this!"*
- *"This is getting too complex!"*
- *"I can't manually manage all of this!"*
- *"I should have become a farmer instead?!"*


<!--end_slide-->

<!--font_size: 5-->
BUT FEAR NOT!
===

<!--newline-->
<!--alignment: center-->
<!--font_size: 3-->
# Introducing
![image:width:50%](./terraform-logo.png)

<!--end_slide-->

Terraform
===

# What is Terraform?
- Infrastructure as Code (IaC) tool
- Manages **resources**

---

# What's a resource?
 **Anything can be a resource**

<!--column_layout: [1, 1, 1]-->
<!--column: 0-->
+ Commonly: cloud resources
  - Databases
  - Object Storage
  - Serverless functions
  - Container services
  - Compute instances

<!--column: 1-->
- But also
  - Proxmox VMs
  - TLS certificates
  - Spotify playlists[^3]
  - Discord servers[^4]
  - Domino's pizza orders[^5]

<!--reset_layout-->
<!--pause-->

---

# Why Infrastructure as Code?
- Reproducible
- Version controlled
- Reviewable
- Self-documenting
- Automated
- Recoverable

<!--end_slide-->

Terraform Providers
---

# What are Terraform Providers?
- Terraform *"plugins"*
- Manage **resources** of a **service**
- Provides data sources

---
# Example providers
<!--alignment: center-->
<!--column_layout: [1, 1, 1, 1]-->
<!--column: 0-->
## AWS
![image:width:70%](./logos/aws.png)
hashicorp/aws

<!--column: 1-->
## Azure
![image:width:70%](./logos/azure.png)
hashicorp/azurerm

<!--column: 2-->
## GCP
![image:width:70%](./logos/gcp.png)
hashicorp/google

<!--column: 3-->
## Domino's
![image:width:70%](./logos/dominos.png)
ndmckinley/dominos[^5]

<!--reset_layout-->

---

<!--column_layout: [1, 1]-->
<!--column: 0-->
# Example resources
- aws_s3_bucket
- aws_lambda_function
- aws_dynamodb_table

<!--column: 1-->
# Example data sources
- aws_region
- aws_caller_identity
- aws_ip_ranges

<!--end_slide-->

Footnotes
===

[^1]: https://www.oreilly.com/radar/the-cloud-in-2021-adoption-continues/
[^2]: https://www.grandviewresearch.com/industry-analysis/cloud-computing-industry
[^3]: https://registry.terraform.io/providers/conradludgate/spotify/latest
[^4]: https://registry.terraform.io/providers/Lucky3028/discord/latest
[^5]: https://github.com/nat-henderson/terraform-provider-dominos

<!--end_slide-->
