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
| <a name="module_notification_security_hub"></a> [notification\_security\_hub](#module\_notification\_security\_hub) | ./modules/notification_security_hub | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_rule_name"></a> [cloudwatch\_rule\_name](#input\_cloudwatch\_rule\_name) | Rule of event bridge to receive event of security hub | `string` | n/a | yes |
| <a name="input_severity_label"></a> [severity\_label](#input\_severity\_label) | value of severity label to notifty | `list(string)` | `null` | no |
| <a name="input_sns_email"></a> [sns\_email](#input\_sns\_email) | Mail to send with sns tu-email@example.com | `string` | n/a | yes |
| <a name="input_sns_protocol"></a> [sns\_protocol](#input\_sns\_protocol) | protocole of sns topic | `string` | n/a | yes |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | name of sns topic | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Powered with 💖 by DinoCloud
