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
  version    = "4.5.6+0.gffc6f942"

  set {
    name  = "global.operator.watchNamespace"
    value = "kubecf"
  }

  depends_on = [kubernetes_namespace.cf-operator]

}

