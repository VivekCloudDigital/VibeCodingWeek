provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.app_name}-beanstalk-bucket"
  force_destroy = true
}

resource "aws_s3_bucket_object" "app_zip" {
  bucket = aws_s3_bucket.app_bucket.bucket
  key    = "${var.app_name}.zip"
  source = "${path.module}/../inought-service/${var.app_name}.zip"
  etag   = filemd5("${path.module}/../inought-service/${var.app_name}.zip")
}

resource "aws_elastic_beanstalk_application" "app" {
  name        = var.app_name
  description = "Inought Service deployed via Terraform"
}

resource "aws_elastic_beanstalk_application_version" "app_version" {
  name        = "${var.app_name}-v1"
  application = aws_elastic_beanstalk_application.app.name
  bucket      = aws_s3_bucket.app_bucket.bucket
  key         = aws_s3_bucket_object.app_zip.key
  version_label = "${var.app_name}-v1"
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = "${var.app_name}-env"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.2 running Node.js 18"
  version_label       = aws_elastic_beanstalk_application_version.app_version.version_label

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "NODE_ENV"
    value     = "production"
  }
}
