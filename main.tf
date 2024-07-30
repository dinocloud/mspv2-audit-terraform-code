# Main
module "notification_security_hub" {
  source               = "./modules/notification-securityhub"
  sns_topic_name       = var.sns_topic_name
  sns_protocol         = var.sns_protocol
  sns_email            = var.sns_email
  cloudwatch_rule_name = var.cloudwatch_rule_name
}
