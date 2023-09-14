variable "name" {
  type    = string
  default = ""
}

variable "environment" {
  type    = string
  default = ""
}

variable "label_order" {
  type    = list(any)
  default = ["name", "environment"]
}

variable "managedby" {
  type    = string
  default = ""
}

variable "repository" {
  type    = string
  default = ""
}

variable "google_compute_firewall_enabled" {
  type    = bool
  default = true
}

variable "enabled" {
  type    = bool
  default = true
}

variable "network" {
  type    = string
  default = ""
}

variable "direction" {
  type    = string
  default = "INGRESS"
}

variable "disabled" {
  type    = bool
  default = true
}

variable "priority" {
  type    = number
  default = 1000
}

variable "allow" {
  type    = list(any)
  default = []
}

variable "deny" {
  type    = list(any)
  default = []
}

variable "project_id" {
  type = string
  default = ""
}

variable "source_ranges" {
  type = any
  default = []
}


