# DinoCloud AWS audit account module

Module description

## Features

- feature 1
- feature 2


## Terraform docs
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_notification_security_hub"></a> [notification\_security\_hub](#module\_notification\_security\_hub) | ./modules/notification-securityhub | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rule_cloudwatch"></a> [rule\_cloudwatch](#input\_rule\_cloudwatch) | Rule of event bridge to receive event of security hub | `string` | n/a | yes |
| <a name="input_sns_mails"></a> [sns\_mails](#input\_sns\_mails) | Mail to send with sns tu-email@example.com | `string` | n/a | yes |
| <a name="input_sns_protocol"></a> [sns\_protocol](#input\_sns\_protocol) | protocole of sns topic | `string` | n/a | yes |
| <a name="input_sns_target_id"></a> [sns\_target\_id](#input\_sns\_target\_id) | target id | `string` | n/a | yes |
| <a name="input_sns_topic"></a> [sns\_topic](#input\_sns\_topic) | name of sns topic | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Powered with 💖 by DinoCloud
