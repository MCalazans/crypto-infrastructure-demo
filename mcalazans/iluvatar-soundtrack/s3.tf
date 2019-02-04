###
### S3 - Bucket para manutenção do estado do terraform
###
resource "aws_s3_bucket" "terraform_state"{
    bucket = "${var.project_name}-maykocalazans-terraform-statecontroll"
    versioning {
        enabled = true
    }
    lifecycle {
        prevent_destroy = false
        ignore_changes = ["bucket"]
    }
}
