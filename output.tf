output "firewall_id" {
  value = join("", google_compute_firewall.default.*.id)
}

output "name" {
  value = join("", google_compute_firewall.default.*.name)
}

output "firewall_creation_timestamp" {
  value = join("", google_compute_firewall.default.*.creation_timestamp)
}

output "firewall_self_link" {
  value = join("", google_compute_firewall.default.*.self_link)
}
