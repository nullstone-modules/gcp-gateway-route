data "ns_connection" "subdomain" {
  name     = "subdomain"
  contract = "subdomain/gcp/cloud-dns"
}

locals {
  subdomain_fqdn    = data.ns_connection.subdomain.outputs.fqdn
  subdomain_zone_id = data.ns_connection.subdomain.outputs.zone_id
}

resource "google_dns_record_set" "this" {
  managed_zone = local.subdomain_zone_id
  name         = local.subdomain_fqdn
  rrdatas      = [local.gateway_ip_address]
  type         = "A"
  ttl          = 300
}
