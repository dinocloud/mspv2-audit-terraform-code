variable "sns_topic" {
    type = string
    description = "security-hub-notifications"
}

variable "sns_protocol" {
    type = string
    description = "email"
}

variable "sns_mails" {
    type = string
    description = "tu-email@example.com"
}

variable "rule_cloudwatch" {
    type = string
    description = "security-hub-rule"
}

variable "sns_target_id" {
    type = string
    description = "send-to-sns"
}