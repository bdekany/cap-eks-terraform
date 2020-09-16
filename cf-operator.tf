resource "kubernetes_namespace" "cf-operator" {
  metadata {
    name = "cf-operator"
  }
}

resource "helm_release" "cf-operator" {
  name       = "cf-operator"
  repository = "https://kubernetes-charts.suse.com/"
  chart      = "cf-operator"
  wait       = "true"
  namespace  = "cf-operator"
  version    = var.cf-operator-version

  set {
    name  = "global.operator.watchNamespace"
    value = "kubecf"
  }

  depends_on = [kubernetes_namespace.cf-operator]

}

