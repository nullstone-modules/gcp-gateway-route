locals {
  enable_https     = true
  protocol         = local.enable_https ? "https" : "http"
  vanity_subdomain = local.subdomain_name
  port             = local.enable_https ? 443 : local.service_port
  vanity_url       = "${local.protocol}://${local.vanity_subdomain}:${local.port}"
}

output "public_urls" {
  value = [
    {
      url = local.vanity_url
    }
  ]
}
