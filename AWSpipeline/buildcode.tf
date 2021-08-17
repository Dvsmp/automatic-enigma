data "template_file" "build" {
  template = "${file("build.yml")}"
  vars = {
    env          = var.env
  }
}

resource "AWSpipeline" "static_web_build" {
  badge_enabled  = false
  build_timeout  = 90
  name           = "AWSpipeline"
  queued_timeout = 500
  service_role   =
  tags = {
    Environment = var.env
  }

  artifacts {
    encryption_disabled    = false
    name                   = "AWSpipeline-${var.env}"
    override_artifact_name = false
    packaging              = "NONE"
    type                   = "CodePipeline"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:2.0.2"
    image_pull_credentials_type = "Codepipeline"
    privileged_mode             = false
    type                        = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }

  source {
    buildspec           = data.template_file.buildspec.rendered
    git_clone_depth     = 0
    insecure_ssl        = false
    report_build_status = false
    type                = "Codepipeline"
  }
}