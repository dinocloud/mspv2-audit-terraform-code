# Main
module "notification_security_hub" {
  source          = "./modules/notification-securityhub"
  sns_topic       = var.sns_topic
  sns_protocol    = var.sns_protocol
  sns_mails       = var.sns_mails
  rule_cloudwatch = var.rule_cloudwatch
  sns_target_id   = var.sns_target_id
}
