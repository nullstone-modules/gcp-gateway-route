resource "kubernetes_manifest" "route-to-service" {
  manifest = {
    apiVersion = "gateway.networking.k8s.io/v1beta1"
    kind       = "HTTPRoute"

    metadata = {
      name      = "${local.resource_name}-https"
      namespace = local.kubernetes_namespace
      labels    = local.labels
    }

    spec = {
      parentRefs = [
        {
          kind      = "Gateway"
          name      = local.gateway_name
          namespace = local.gateway_namespace
        }
      ]

      hostnames = [trimsuffix(local.subdomain_fqdn, ".")]

      rules = [
        {
          backendRefs = [
            {
              name = local.service_name
              port = local.service_port
            }
          ]
        }
      ]
    }
  }
}
