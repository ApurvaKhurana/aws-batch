# ECS Instance role
resource "aws_iam_role" "ecs_instance_role" {
  name = "${var.service_name}-ecs-instance-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
        "Service": "ec2.amazonaws.com"
        }
    }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role" {
  role       = aws_iam_role.ecs_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs_instance_role" {
  name = "${var.service_name}-ecs-instance-role"
  role = aws_iam_role.ecs_instance_role.name
}

# Batch service role
resource "aws_iam_role" "aws_batch_service_role" {
  name = "${var.service_name}-aws-batch-service-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
        "Service": "batch.amazonaws.com"
        }
    }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "aws_batch_service_role" {
  role       = aws_iam_role.aws_batch_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}

# Compute environment resource
resource "aws_batch_compute_environment" "my_compute_environment" {
  compute_environment_name = var.compute_environment_name

  compute_resources {
    instance_role = aws_iam_instance_profile.ecs_instance_role.arn

    instance_type      = var.instance_type
    max_vcpus          = var.maxvcpus
    min_vcpus          = var.minvcpus
    security_group_ids = [aws_default_security_group.default_security_group.id]
    subnets            = data.aws_subnets.default_subnets.ids

    type = "EC2"

    # tags = var.resource_tags

  }

  service_role = aws_iam_role.aws_batch_service_role.arn
  type         = "MANAGED"
  depends_on   = [aws_iam_role_policy_attachment.aws_batch_service_role]
}