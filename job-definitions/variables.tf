##jobdefinition variables
# my service variables
variable "service_name" {
  description = "service_name"
  default     = "my-service"
}
variable "my_service_jd_command" {
  description = "myservice_jd_command"
  default     = "command"
}
variable "docker_image" {
  description = "docker image"
  default     = "docker_image"
}
variable "memory" {
  description = "container memory"
  default     = 1024
}
variable "vcpus" {
  description = "container vcpu"
  default     = 2
}
variable "command" {
  description = "Command for job definition"
  default     = ["run.py", "--var1", "Ref::var1"]
}
