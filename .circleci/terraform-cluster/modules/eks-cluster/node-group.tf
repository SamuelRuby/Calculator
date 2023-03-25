data "aws_ssm_parameter" "eks_ami_release_version" {
  name = "/aws/service/eks/optimized-ami/${aws_eks_cluster.eks.version}/amazon-linux-2/recommended/release_version"
}

# Create Node Group

 resource "aws_eks_node_group" "private-worker-node-group" {
  cluster_name  = aws_eks_cluster.eks.name
  node_group_name = "${var.namespace}-workernodes"
  node_role_arn  = aws_iam_role.workernodes.arn
  version = aws_eks_cluster.eks.version
  release_version = data.aws_ssm_parameter.eks_ami_release_version.value
  subnet_ids   = [var.priv_subnet_id_1, var.priv_subnet_id_2]
  instance_types = ["t3.medium"]
  capacity_type = "ON_DEMAND"
  disk_size = 100
  remote_access {
    ec2_ssh_key = "${var.namespace}-key"
  }
 
  scaling_config {
   desired_size = 2
   max_size   = 3
   min_size   = 1
  }

  update_config {
    max_unavailable = 1
    # max_unavailable_percentage = 50
  }
 
  depends_on = [
   aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
   aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
   aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
 }
