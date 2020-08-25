resource "random_password" "password" {
  length = 8
  special = true
}

resource "helm_release" "kubecf" {
  name       = "kubecf"
  repository = "https://kubernetes-charts.suse.com/"
  chart      = "kubecf"
  namespace  = "kubecf"
  version = "2.2.2"

  set {
    name = "credentials.cf_admin_password"
    value  = random_password.password.result
  }

  set {
    name = "credentials.uaa_admin_client_secret"
    value = random_password.password.result
  }

  set {
    name = "system_domain"
    value = "${data.external.system_domain.result.ip}.xip.io"
  }

  set {
    name = "features.ingress.enabled"
    value = "true"
  }

  set {
    name = "features.ingress.tls.crt"
    value = tls_self_signed_cert.example.cert_pem
  }

  set {
    name = "features.ingress.tls.key"
    value  = tls_private_key.example.private_key_pem
  }
}
