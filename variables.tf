variable "sns_topic_name" {
  type        = string
  description = "name of sns topic"
}

variable "sns_protocol" {
  type        = string
  description = "protocole of sns topic"
}

variable "sns_email" {
  type        = string
  description = "Mail to send with sns tu-email@example.com"
}

variable "cloudwatch_rule_name" {
  type        = string
  description = "Rule of event bridge to receive event of security hub"
}
