#my-service batch task role
resource "aws_iam_role" "my_service_taks_role" {
  name = "my-service-taks-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
        }
    }
    ]
}
EOF
}

#my-service batch task role policy document
data "aws_iam_policy_document" "my_service_taks_role_policy" {
  statement {
    sid = "AllowLogsQuery"
    actions = [
      "ec2:*",
      "logs:*",
      "ecs:*",
      "cloudwatch:*",
      "iam:GetInstanceProfile",
      "iam:GetRole",
      "autoscaling:*",
      "s3:*",
      "secretsmanager:*"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

#my-service batch task role policy
resource "aws_iam_policy" "my_service_taks_role_policy" {
  name        = "my-service-taks-role-policy"
  description = "Batch Job task role policy"
  policy      = data.aws_iam_policy_document.my_service_taks_role_policy.json
}

#my-service batch task role policy attachment
resource "aws_iam_role_policy_attachment" "aws_jd_task_role" {
  role       = aws_iam_role.my_service_taks_role.name
  policy_arn = aws_iam_policy.my_service_taks_role_policy.arn
}

#Job-definitions
resource "aws_batch_job_definition" "my_service_batch_jd" {
  name                 = "my-service-batch-jd"
  type                 = "container"
  container_properties = <<EOF
  {
      "command": ${jsonencode(var.command)},
      "image": "${var.docker_image}",
      "memory": ${var.memory},
      "vcpus": ${var.vcpus},
      "jobRoleArn": "${aws_iam_role.my_service_taks_role.arn}"
  }
  EOF
}