variable "sns_topic_name" {
  type        = string
  description = "Sns topic name"
}

variable "sns_protocol" {
  type        = string
  description = "SNS protocol"
  default     = "email"
}

variable "sns_email" {
  type        = string
  description = "Email address to receive notifications"
}

variable "cloudwatch_rule_name" {
  type        = string
  description = "Cloudwatch rule name"
}

variable "severity_label" {
  description = "value of severity label to notifty"
  type        = list(string)
  default     = null
}
