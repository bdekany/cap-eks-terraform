resource "null_resource" "install_epinio" {
  depends_on = [module.eks.cluster_id]

  provisioner "local-exec" {
    command = "./install.sh"
    environment = {
      KUBECONFIG = "kubeconfig_${local.cluster_name}"
      VERSION = "${var.epinio_version}"
    }
  }
}
