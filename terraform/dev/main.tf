module "vpc" {
  source = "../modules/vpc"
}

module "eks" {
  source = "../modules/eks"

  cluster_name = "blog-eks-cluster"
  subnet_ids   = module.vpc.subnet_ids
  vpc_id       = module.vpc.vpc_id
}