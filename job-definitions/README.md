
## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| instance_type | The ce_subnets | `list(string)` | `false` | no |
| jd_memory | Batch job definition memory | `string` | `true` | no |
| jd_vcpus | VCPUs required by the job definition | `string` | `true` | no |
| job_command | Job definition command | `list` | `true` | no |
| job_queue_name | The name of the job queue | `string` | `true` | no |
| job_queue_priority | Job definition command | `string` | `true` | no |
| maxvcpus | Max allowed Vcpus to be spun up by compute environment | `string` | `true` | no |
| minvcpus | Min allowed Vcpus to be spun up by compute environment | `string` | `true` | no |
| region | AWS availability zone/region | `string` | `true` | no |


## Outputs
| Name | Description |
|------|-------------|
| job_queue_arn | The ARN of the Batch Job queue created |
| job_definition_arn | The ARN of the Batch Job definition created |
| job_definition_name | The Name of the Batch Job definition created |
| job_queue_arn | The ARN of the Batch Job queue | 

## Test Commit 

