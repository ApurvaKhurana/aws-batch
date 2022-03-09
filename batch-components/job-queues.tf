resource "aws_batch_job_queue" "my_batch_queue" {
  name     = "my-batch-queue"
  state    = "ENABLED"
  priority = 3
  compute_environments = [
    aws_batch_compute_environment.my_compute_environment.arn
  ]
}
