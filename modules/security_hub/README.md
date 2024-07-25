# security_hub

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.59.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_securityhub_finding_aggregator.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_finding_aggregator) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_specified_regions"></a> [specified\_regions](#input\_specified\_regions) | The regions to aggregate findings from. | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
