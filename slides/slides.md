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
- 47% pursuing cloud-first strategy[^1]
- Global cloud market worth **$600B+**[^2]
- Average enterprise uses **2.6** public clouds[^3]

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

Footnotes
===

[^1]: https://www.oreilly.com/radar/the-cloud-in-2021-adoption-continues/
[^2]: https://www.grandviewresearch.com/industry-analysis/cloud-computing-industry
[^3]: https://www.flexera.com/blog/cloud/cloud-computing-trends/

<!--end_slide-->
