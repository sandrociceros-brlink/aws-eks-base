provider "aws" {
  version             = "3.26.0"
  region              = local.region
  allowed_account_ids = var.allowed_account_ids
}

provider "kubernetes" {
  version                = "2.0.2"
  host                   = data.aws_eks_cluster.main.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.main.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.main.token
}

provider "helm" {
  version = "2.0.2"
  kubernetes {
    host                   = data.aws_eks_cluster.main.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.main.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.main.token
  }
}

data "aws_eks_cluster" "main" {
  name = local.eks_cluster_id
}

data "aws_eks_cluster_auth" "main" {
  name = local.eks_cluster_id
}
