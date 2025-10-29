#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = "OpsStation"
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "managedby" {
  type        = string
  default     = "opsstation'."
  description = "ManagedBy,opsstation'."
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags for the resource."
}

variable "network" {
  type        = string
  default     = ""
  description = "(Required) The VPC network the subnets belong to. Only networks that are in distributed mode can have subnetworks."
}

variable "ingress_rules" {
  description = "List of ingress firewall rules."
  type = list(object({
    name                    = string
    description             = optional(string, null)
    disabled                = optional(bool, null)
    direction               = string # "INGRESS"
    source_ranges           = optional(list(string), ["0.0.0.0/0"])
    source_tags             = optional(list(string), null)
    source_service_accounts = optional(list(string), null)
    target_tags             = optional(list(string), null)
    target_service_accounts = optional(list(string), null)
    priority                = optional(number, 1000)
    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string), ["all"])
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string), null)
    })), [])
  }))
  default = null
}

variable "egress_rules" {
  description = "List of egress firewall rules."
  type = list(object({
    name                    = string
    description             = optional(string, null)
    disabled                = optional(bool, null)
    direction               = string # "EGRESS"
    destination_ranges      = optional(list(string), ["0.0.0.0/0"])
    target_tags             = optional(list(string), null)
    target_service_accounts = optional(list(string), null)
    priority                = optional(number, 1000)
    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string), ["all"])
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string), null)
    })), [])
  }))
  default = [
    {
      name               = "allow-all-egress"
      description        = "Allow all egress traffic"
      disabled           = false
      direction          = "EGRESS"
      priority           = 1000
      destination_ranges = ["0.0.0.0/0"]
      allow = [
        {
          protocol = "all"
          ports    = []
        }
      ]
    }
  ]
}