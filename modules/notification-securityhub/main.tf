terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.20.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}

# Crear un SNS Topic
resource "aws_sns_topic" "security_hub_topic" {
  name = var.sns_topic
}

# Crear una suscripción al SNS Topic
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.security_hub_topic.arn
  protocol  = var.sns_protocol
  endpoint  = var.sns_mails  # Cambia esto a tu dirección de correo electrónico
}

# Crear una regla de EventBridge para Security Hub
resource "aws_cloudwatch_event_rule" "security_hub_rule" {
  name        = var.rule_cloudwatch
  description = "Captura eventos de AWS Security Hub"
  event_pattern = jsonencode({
    "source": ["aws.securityhub"],
    "detail-type": ["Security Hub Findings - Imported"]
  })
}


# Cargar y procesar la política desde el archivo
data "template_file" "policy_to_publish" {
  template = file("${path.module}/policies/policy_to_publish.json")
  vars = {
    arn_sns_topic    = aws_sns_topic.security_hub_topic.arn
  }
}

# Permitir a EventBridge publicar en el SNS Topic
resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn = aws_sns_topic.security_hub_topic.arn

  policy = data.template_file.policy_to_publish.rendered
}

# Configurar el objetivo de la regla de EventBridge
resource "aws_cloudwatch_event_target" "sns_target" {
  rule      = aws_cloudwatch_event_rule.security_hub_rule.name
  target_id = var.sns_target_id
  arn       = aws_sns_topic.security_hub_topic.arn

  input_transformer {
    input_paths = {
	"resources" : "$.resources",
    "description" : "$.detail.findings[0].Description",
    "AwsAccountId" : "$.detail.findings[0].AwsAccountId",
    "Severity"	: "$.detail.findings[0].Severity",
    "Remediation" : "$.detail.findings[0].Remediation.Recommendation"
}
        
    input_template = "{ \"In the resources\": <resources> , \"of AwsAccountId\": <AwsAccountId>  , \"a finding was made\": <description> , \"with Severity\": <Severity> , \"the recommendation is\": <Remediation> }"

  }
}
