#my_service_taks_role_arn
output "my_service_taks_role_arn" {
  value = aws_iam_role.my_service_taks_role.arn
}

output "my_service_taks_role_policy_arn" {
  value = aws_iam_policy.my_service_taks_role_policy.arn
}

output "my_service_batch_jd_arn" {
  value = aws_batch_job_definition.my_service_batch_jd.arn
}
