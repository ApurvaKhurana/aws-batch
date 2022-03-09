
# High-Throughput Batch Computing on AWS.
IaC setup for high-throutput-batch-workflow setup in AWS using Batch written in terrraform.

<img src="https://logodix.com/logo/1686050.png" height="32" width="32"> ![terraform version](https://img.shields.io/badge/terraform-v0.12.28-purple)

## Set up
### Get terraform
```shell
wget https://releases.hashicorp.com/terraform/1.1.17/terraform_1.1.17_linux_amd64.zip
unzip terraform_1.1.17_linux_amd64.zip
mv terraform /usr/local/bin/
```
or 
```shell
brew install terraform # OS X 
```

## Requirements
| Name | Version |
|------|---------|
| terraform | ~> 1.1.17 |
| aws | ~> 3.35 |

### Prerequisites
 - VPC default/ custom should be already present.
 - ECR & docker image should be already present

### Author
 - [Apurva Khurana](https://github.com/ApurvaKhurana) 
