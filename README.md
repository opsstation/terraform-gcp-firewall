# Terraform-gcp-firewall
# Google Cloud Infrastructure Provisioning with Terraform
## Table of Contents

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Authors](#authors)
- [License](#license)

## Introduction
This project deploys a Google Cloud infrastructure using Terraform to create firewall .

## Usage

To use this module, you should have Terraform installed and configured for GCP. This module provides the necessary Terraform configuration for creating GCP resources, and you can customize the inputs as needed. Below is an example of how to use this module:
# Example: _firewall_

```hcl
module "firewall" {
  source        = "https://github.com/opsstation/terraform-gcp-firewall.git"
  name          = "dev"
  environment   = "test"
  label_order   = ["name", "environment"]
  network       = module.vpc.vpc_id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]

  allow = [
    { protocol = "tcp"
      ports    = ["22", "80"]
    }
  ]
}

```

This example demonstrates how to create various GCP resources using the provided modules. Adjust the input values to suit your specific requirements.

## Module Inputs

- `name`: The name of the application or resource.
- `environment`: The environment in which the resource exists.
- `label_order`: The order in which labels should be applied.
- `business_unit`: The business unit associated with the application.
- `attributes`: Additional attributes to add to the labels.
- `extra_tags`: Extra tags to associate with the resource.

## Module Outputs
- This module currently does not provide any outputs.

# Examples
For detailed examples on how to use this module, please refer to the [example](https://github.com/opsstation/terraform-gcp-firewall/tree/master/_example) directory within this repository.

## Authors
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/opsstation/terraform-gcp-firewall/blob/master/LICENSE) file for details.



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.50, < 5.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.82.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::git@github.com:opsstation/terraform-gcp-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow"></a> [allow](#input\_allow) | (Optional) The list of ALLOW rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a permitted connection. | `list(any)` | `[]` | no |
| <a name="input_deny"></a> [deny](#input\_deny) | (Optional) The list of deny rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a permitted connection. | `list(any)` | `[]` | no |
| <a name="input_direction"></a> [direction](#input\_direction) | Optional) Direction of traffic to which this firewall applies; default is INGRESS. Note: For INGRESS traffic, one of source\_ranges, source\_tags or source\_service\_accounts is required. Possible values are: INGRESS, EGRESS. | `string` | `"INGRESS"` | no |
| <a name="input_disabled"></a> [disabled](#input\_disabled) | (Optional) Denotes whether the firewall rule is disabled, i.e not applied to the network it is associated with. When set to true, the firewall rule is not enforced and the network behaves as if it did not exist. If this is unspecified, the firewall rule will be enabled. | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | A boolean flag to enable/disable firewall. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_firewall_enabled"></a> [firewall\_enabled](#input\_firewall\_enabled) | A boolean flag to enable/disable firewall. | `bool` | `true` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy'opsstation'. | `string` | `"opsstation"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource. Provided by the client when the resource is created. | `string` | `""` | no |
| <a name="input_network"></a> [network](#input\_network) | (Required) The VPC network the subnets belong to. Only networks that are in the distributed mode can have subnetworks. | `string` | `""` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | The priority of this route. | `number` | `1000` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `""` | no |
| <a name="input_source_ranges"></a> [source\_ranges](#input\_source\_ranges) | (Optional) If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges. | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_creation_timestamp"></a> [firewall\_creation\_timestamp](#output\_firewall\_creation\_timestamp) | Creation timestamp in RFC3339 text format. |
| <a name="output_firewall_id"></a> [firewall\_id](#output\_firewall\_id) | Name of the resource. Provided by the client when the resource is created. |
| <a name="output_firewall_self_link"></a> [firewall\_self\_link](#output\_firewall\_self\_link) | The URI of the created resource. |
| <a name="output_name"></a> [name](#output\_name) | an identifier for the resource with format |
<!-- END_TF_DOCS -->