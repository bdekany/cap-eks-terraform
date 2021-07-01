output "cluster_id" {
  description = "EKS cluster ID."
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}

output "kubecf_status" {
  description = "Watch KubeCF desployement"
  value       = "KUBECONFIG=./kubeconfig_${local.cluster_name} watch kubectl get pods -n kubecf"
}

output "admin_password" {
  description = "Admin password CF and uaa"
  value       = random_password.password.result
}

output "api_url" {
  description = "CF API url"
  value       = "https://api.${data.external.system_domain.result.ip}.xip.io"
}

output "stratos_url" {
  description = "Get stratos url (https)"
  value      = "KUBECONFIG=./kubeconfig_${local.cluster_name} kubectl get svc/console-ui-ext"
}
