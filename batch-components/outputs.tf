# default vpc resorces
#default vpc id
output "default_vpc_id" {
  value = aws_default_vpc.default_vpc.id
}
#default subnet ids
output "default_subnet_ids" {
  value = data.aws_subnets.default_subnets.ids
}
#default security group id
output "default_security_group_id" {
  value = aws_default_security_group.default_security_group.id
}

#compute environment resources
# ecs instance role
output "ecs_instance_role_arn" {
  value = aws_iam_role.ecs_instance_role.arn
}
# ecs instance profile
output "ecs_instance_role_profile_arn" {
  value = aws_iam_instance_profile.ecs_instance_role.arn
}
# Batch service role
output "aws_batch_service_role_arn" {
  value = aws_iam_role.aws_batch_service_role.arn
}
# Compute environment
output "aws_batch_compute_environment_arn" {
  value = aws_batch_compute_environment.my_compute_environment.arn
}

#Job Queue
output "aws_batch_job_queue_arn" {
  value = aws_batch_job_queue.my_batch_queue.arn
}
