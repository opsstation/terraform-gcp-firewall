# 🏗️ Terraform-google-firewall
# Google Cloud Infrastructure Provisioning with Terraform

[![OpsStation](https://img.shields.io/badge/Made%20by-OpsStation-blue?style=flat-square&logo=terraform)](https://www.opsstation.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Terraform](https://img.shields.io/badge/Terraform-1.13%2B-purple.svg?logo=terraform)](#)
[![CI](https://github.com/OpsStation/terraform-gcp-firewall/actions/workflows/ci.yml/badge.svg)](https://github.com/OpsStation/terraform-gcp-firewall/actions/workflows/ci.yml)
[![Latest Release](https://img.shields.io/github/release/opsstation/terraform-gcp-firewall.svg)](https://github.com/opsstation/terraform-gcp-firewall/releases/latest)

> 🌩️ **A production-grade, reusable GCP firewall module by [OpsStation](https://www.opsstation.com)**
> Designed for reliability, performance, and security — following GCP networking best practices.
---

## 🏢 About OpsStation

**OpsStation** delivers **Cloud & DevOps excellence** for modern teams:
- 🚀 **Infrastructure Automation** with Terraform, Ansible & Kubernetes
- 💰 **Cost Optimization** via scaling & right-sizing
- 🛡️ **Security & Compliance** baked into CI/CD pipelines
- ⚙️ **Fully Managed Operations** across GCP, Azure, and AWS

> 💡 Need enterprise-grade DevOps automation?
> 👉 Visit [**www.opsstation.com**](https://www.opsstation.com) or email **hello@opsstation.com**

---
## 🌟 Features

🔥 Terraform GCP Firewall Module Features

- ✅ Creates GCP firewall rules for ingress and egress traffic with full configuration support

- ✅ Supports multiple rule definitions via dynamic blocks (for both allow and deny rules)

- ✅ Enables fine-grained control with source/destination ranges, tags, and service accounts

- ✅ Integrates seamlessly with VPC module outputs for automatic network attachment

- ✅ Supports **custom labels** using [OpsStation multicloud module](https://registry.terraform.io/modules/opsstation/labels/multicloud/latest)

- ✅ Provides output values such as rule IDs, names, self-links, and creation timestamps

- ✅ Built with idempotent and modular design, suitable for multi-environment deployments (dev, stage, prod)

- ✅ Follows Google Cloud best practices for security and naming standards

---


## ⚙️ Usage Example
### 🧱  firewall Example
```hcl
module "firewall" {
  source      = "opsstation/firewall/gcp"
  version     = "1.0.1"
  name        = "firewall"
  environment = "OpsStation"
  network     = module.vpc.vpc_id
  ingress_rules = [
    {
      name          = "allow-tcp-http-ingress"
      description   = "Allow TCP, HTTP ingress traffic"
      disabled      = false
      direction     = "INGRESS"
      priority      = 1000
      source_ranges = ["0.0.0.0/0"]
      allow = [
        {
          protocol = "tcp"
          ports    = ["22", "80"]
        }
      ]
    }
  ]
}

```
### ☁️ Outputs (GCP firewall Module)

| **Name**                       | **Description**                        |
| ------------------------------ | -------------------------------------- |
| `firewall_id`                  | IDs of the created firewall rules.     |
| `firewall_names`               | Names of the created firewall rules.   |
| `firewall_creation_timestamps` | Creation timestamps of firewall rules. |
| `firewall_self_links`          | Self-links of the firewall rules.      |
| `vpc_id`                       | The ID of the created VPC network.     |
| `vpc_name`                     | The name of the created VPC network.   |
| `self_link`                    | The URI of the created VPC resource.   |
| `gateway_ipv4`                 | The default IPv4 gateway of the VPC.   |

---
### ☁️ Tag Normalization Rules (GCP)

| Cloud | Case      | Allowed Characters | Example                            |
|--------|-----------|------------------|------------------------------------|
| **GCP** | TitleCase | Any              | `Name`, `Environment`, `CostCenter` |

---

### 💙 Maintained by [OpsStation](https://www.opsstation.com)
> OpsStation — Simplifying Cloud, Securing Scale.
