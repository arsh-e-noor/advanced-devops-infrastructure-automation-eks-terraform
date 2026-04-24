variable "cluster_name" {
  default = "blog-eks-cluster"
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}