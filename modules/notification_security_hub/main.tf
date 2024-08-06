# Create SNS topic
resource "aws_sns_topic" "security_hub_topic" {
  name = var.sns_topic_name
}

# Create SNS topic subscription
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.security_hub_topic.arn
  protocol  = var.sns_protocol
  endpoint  = var.sns_email
}

############ Configure EventBridge ############
resource "aws_cloudwatch_event_rule" "security_hub_rule" {
  name        = var.cloudwatch_rule_name
  description = "Capture Security Hub events."
  event_pattern = jsonencode({
    "source" : ["aws.securityhub"],
    "detail-type" : ["Security Hub Findings - Imported"],
    "Severity" : {
      "Label" : var.severity_label
    }
  })
}

resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn = aws_sns_topic.security_hub_topic.arn

  policy = templatefile("${path.module}/policies/policy_to_publish.json", { arn_sns_topic = aws_sns_topic.security_hub_topic.arn })
}

resource "aws_cloudwatch_event_target" "sns_target" {
  rule = aws_cloudwatch_event_rule.security_hub_rule.name
  arn  = aws_sns_topic.security_hub_topic.arn

  input_transformer {
    input_paths = {
      "resources" : "$.resources",
      "description" : "$.detail.findings[0].Description",
      "AwsAccountId" : "$.detail.findings[0].AwsAccountId",
      "Severity" : "$.detail.findings[0].Severity",
      "Remediation" : "$.detail.findings[0].Remediation.Recommendation"
    }

    input_template = "{ \"In the resources\": <resources> , \"of AwsAccountId\": <AwsAccountId>  , \"a finding was made\": <description> , \"with Severity\": <Severity> , \"the recommendation is\": <Remediation> }"

  }
}
