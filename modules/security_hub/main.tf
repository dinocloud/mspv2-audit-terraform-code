################# Security Hub AUDIT RESOURCES #################

data "aws_caller_identity" "audit" {
}

resource "aws_securityhub_account" "audit" {
  enable_default_standards = false
}

# aggregators in audit
resource "aws_securityhub_finding_aggregator" "this" {
  linking_mode = "SPECIFIED_REGIONS"
  specified_regions = var.specified_regions
  depends_on   = [aws_securityhub_account.audit]
}