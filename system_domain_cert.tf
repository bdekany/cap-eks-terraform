#data "external" "system_domain" {
#  program = ["bash", "${path.module}/get_ip.sh"]
#  query = {
#    kubeconfig = "kubeconfig_${local.cluster_name}"
#  }
#  depends_on = [helm_release.nginx_ingress]
#}
#
#resource "tls_private_key" "example" {
#  algorithm = "RSA"
#}
#
#resource "tls_self_signed_cert" "example" {
#  key_algorithm   = tls_private_key.example.algorithm
#  private_key_pem = tls_private_key.example.private_key_pem
#
#  # Certificate expires after 12 hours.
#  validity_period_hours = 12
#
#  # Generate a new certificate if Terraform is run within three
#  # hours of the certificate's expiration time.
#  early_renewal_hours = 3
#
#  # Reasonable set of uses for a server SSL certificate.
#  allowed_uses = [
#      "key_encipherment",
#      "digital_signature",
#      "server_auth",
#  ]
#
#  dns_names = [
#   "*.${data.external.system_domain.result.ip}.xip.io",
#   "*.uaa.${data.external.system_domain.result.ip}.xip.io",
#   "uaa.${data.external.system_domain.result.ip}.xip.io",
#   "scf.${data.external.system_domain.result.ip}.xip.io",
#   "scf.uaa.${data.external.system_domain.result.ip}.xip.io",
#   "uaa",
#   "scf"
#  ]
#
#  subject {
#      common_name  = "${data.external.system_domain.result.ip}.xip.io"
#      organization = "ACME Examples, Inc"
#  }
#}


