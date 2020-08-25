# Terraform - Provision an EKS Cluster + SUSE CAP 2.0 (with nginx-ingress)

This simple Terraform will provision:

 - EKS cluster on 5 t3.medium nodes
 - Create a .xip.io based on LB public IP
 - Helm install CAP 2.0

## Before starting

Commands needed:

 - aws-cli
 - kubectl
 - terraform

```shell
sudo zypper -n install aws-cli kubernetes-client terraform
```

Configure it to use your credentials.

```shell
$ aws configure
AWS Access Key ID [None]: <YOUR_AWS_ACCESS_KEY_ID>
AWS Secret Access Key [None]: <YOUR_AWS_SECRET_ACCESS_KEY>
Default region name [None]: <YOUR_AWS_REGION>
Default output format [None]: json
```

This enables Terraform access to the configuration file and performs operations on your behalf with these security credentials.

## Terraforming


After you've done this, initalize your Terraform workspace, which will download 
the provider and initialize it with the values provided in the `terraform.tfvars` file.

```shell
$ terraform init
Terraform has been successfully initialized!
```

Then, provision your EKS cluster by running `terraform apply`. This will 
take approximately 10 minutes.

```shell
$ terraform apply

# Output truncated...

Plan: 51 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

# Output truncated...

Apply complete! Resources: 51 added, 0 changed, 0 destroyed.

Outputs:
admin_password = aN*I2E>S
api_url = https://api.X.Y.Z.A.xip.io
cluster_endpoint = https://xxxxx.us-east-1.eks.amazonaws.com
cluster_name = training-eks-29smnZuW
kubecf_status = KUBECONFIG=./kubeconfig_training-eks-29smnZuW kubectl get pods -n kubecf
stratos_url = KUBECONFIG=./kubeconfig_training-eks-29smnZuW kubectl get svc/console-ui-ext
```

## Configure kubectl

To configure kubetcl you need to you the kubeconfig_cluster-name 

```shell
$ export KUBECONFIG=./kubeconfig_training-eks-29smnZuW
$ kubectl get nodes
```

## Force admin Password

```shell
$ terraform import random_password.password securepassword
```
