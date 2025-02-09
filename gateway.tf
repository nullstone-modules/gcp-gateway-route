data "ns_connection" "gateway" {
  name     = "gateway"
  contract = "ingress/gcp/gateway:*"
}

locals {
  gateway_name       = data.ns_connection.gateway.outputs.gateway_name
  gateway_namespace  = data.ns_connection.gateway.outputs.gateway_namespace
  gateway_ip_address = data.ns_connection.gateway.outputs.gateway_ip_address
}
