variable "env" {
  description = "Deployment environment"
  default = "dev"
}
variable "region" {
  description = "AWS region"
  default = "us-west-1"
}

variable "env" {
  description = "Deployment environment"
  default     = "dev"
}

variable "repository_branch" {
  description = "Repository branch to connect to"
  default     = "develop"
}

variable "repository_owner" {
  description = "GitHub repository owner"
  default     = "Wick"
}

variable "repository_name" {
  description = "GitHub repository name"
  default     = "AWSpipeline"
}

variable "static_web_bucket_name" {
  description = "S3 Bucket to deploy to"
  default     = "static-web-example-bucket"
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "artifacts-bucket"
}