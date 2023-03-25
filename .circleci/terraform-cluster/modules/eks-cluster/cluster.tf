# Create Cluster
resource "aws_eks_cluster" "eks" {
 name = "${var.namespace}-cluster"
 role_arn = aws_iam_role.eksClusterRole.arn

 vpc_config {
  subnet_ids = [
    var.priv_subnet_id_1,
    var.priv_subnet_id_2,
    var.pub_subnet_id_1,
    var.pub_subnet_id_2
    ]
 }

 depends_on = [
  aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
  aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
 ]
}