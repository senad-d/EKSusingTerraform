resource "aws_iam_role" "learnk8s" {
  name = "eks-cluster-learnk8s"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "learnk8s-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.learnk8s.name
}

resource "aws_eks_cluster" "learnk8s" {
  name     = "learnk8s"
  role_arn = aws_iam_role.learnk8s.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-eu-west-1a.id,
      aws_subnet.private-eu-west-1b.id,
      aws_subnet.public-eu-west-1a.id,
      aws_subnet.public-eu-west-1b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.learnk8s-AmazonEKSClusterPolicy]
}