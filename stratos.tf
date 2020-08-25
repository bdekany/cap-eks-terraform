resource "helm_release" "console" {
  name       = "console"
  repository = "https://kubernetes-charts.suse.com/"
  chart      = "console"
  wait       = "false"

  set {
    name  = "services.loadbalanced"
    value = "true"
  }
}

