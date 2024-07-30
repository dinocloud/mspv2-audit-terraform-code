variable "sns_topic" {
  type        = string
  description = "name of sns topic"
}

variable "sns_protocol" {
  type        = string
  description = "protocole of sns topic"
}

variable "sns_mails" {
  type        = string
  description = "Mail to send with sns tu-email@example.com"
}

variable "rule_cloudwatch" {
  type        = string
  description = "Rule of event bridge to receive event of security hub"
}

variable "sns_target_id" {
  type        = string
  description = "target id"
}
