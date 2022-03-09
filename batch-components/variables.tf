#compute environment variables
variable "service_name" {
  description = "service_name"
  default     = "my-service"
}
variable "compute_environment_name" {
  description = "compute_environment_name"
  default     = "my-compute-environment"
}
variable "instance_type" {
  description = "The instance_type for compute environment to use"
  type        = list(string)
  default     = ["optimal"]
}
variable "maxvcpus" {
  description = "Max allowed Vcpus to be spun up by compute environment"
  default     = 16
}
variable "minvcpus" {
  description = "Min allowed Vcpus to be spun up by compute environment"
  default     = 0
}



