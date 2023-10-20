## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudwatch_metric_stream"></a> [cloudwatch\_metric\_stream](#module\_cloudwatch\_metric\_stream) | ../.. | n/a |
| <a name="module_firehose_delivery_stream"></a> [firehose\_delivery\_stream](#module\_firehose\_delivery\_stream) | git::https://github.com/nexient-llc/tf-aws-module-firehose_delivery_stream | feature/987 |
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | git::https://github.com/nexient-llc/tf-aws-wrapper_module-s3_bucket | 0.1.1 |

## Resources

| Name | Type |
|------|------|
| [random_string.string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_length"></a> [length](#input\_length) | n/a | `number` | `24` | no |
| <a name="input_naming_prefix"></a> [naming\_prefix](#input\_naming\_prefix) | Prefix for the provisioned resources. | `string` | `"platform"` | no |
| <a name="input_number"></a> [number](#input\_number) | n/a | `bool` | `false` | no |
| <a name="input_special"></a> [special](#input\_special) | n/a | `bool` | `false` | no |

## Outputs

No outputs.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0, <= 1.5.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.57.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.57.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_names"></a> [resource\_names](#module\_resource\_names) | git::https://github.com/nexient-llc/tf-module-resource_name.git | 0.1.0 |
| <a name="module_cloudwatch_metric_stream"></a> [cloudwatch\_metric\_stream](#module\_cloudwatch\_metric\_stream) | ../.. | n/a |
| <a name="module_firehose_delivery_stream"></a> [firehose\_delivery\_stream](#module\_firehose\_delivery\_stream) | git::https://github.com/nexient-llc/tf-aws-module-firehose_delivery_stream | 0.1.0 |
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | git::https://github.com/nexient-llc/tf-aws-wrapper_module-s3_bucket | 0.1.0 |
| <a name="module_cloudwatch_log_group"></a> [cloudwatch\_log\_group](#module\_cloudwatch\_log\_group) | git::https://github.com/nexient-llc/tf-aws-module-cloudwatch_log_group.git | 0.1.0 |
| <a name="module_producer_role"></a> [producer\_role](#module\_producer\_role) | git::https://github.com/nexient-llc/tf-aws-wrapper_module-iam_assumable_role.git | 0.1.0 |
| <a name="module_consumer_role"></a> [consumer\_role](#module\_consumer\_role) | git::https://github.com/nexient-llc/tf-aws-wrapper_module-iam_assumable_role.git | 0.1.0 |

## Resources

| Name | Type |
|------|------|
| [random_string.string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.consumer_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.producer_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | A map of key to resource\_name that will be used by tf-module-resource\_name to generate resource names | <pre>map(object(<br>    {<br>      name       = string<br>      max_length = optional(number, 60)<br>    }<br>  ))</pre> | <pre>{<br>  "consumer_policy": {<br>    "max_length": 60,<br>    "name": "cnsmr-plcy"<br>  },<br>  "consumer_role": {<br>    "max_length": 60,<br>    "name": "cnsmr-role"<br>  },<br>  "delivery_stream": {<br>    "max_length": 60,<br>    "name": "ds"<br>  },<br>  "log_group": {<br>    "max_length": 60,<br>    "name": "lg"<br>  },<br>  "metric_stream": {<br>    "max_length": 60,<br>    "name": "ms"<br>  },<br>  "producer_policy": {<br>    "max_length": 60,<br>    "name": "prdcr-plcy"<br>  },<br>  "producer_role": {<br>    "max_length": 60,<br>    "name": "prdcr-role"<br>  }<br>}</pre> | no |
| <a name="input_naming_prefix"></a> [naming\_prefix](#input\_naming\_prefix) | Prefix for the provisioned resources. | `string` | `"platform"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment in which the resource should be provisioned like dev, qa, prod etc. | `string` | `"dev"` | no |
| <a name="input_environment_number"></a> [environment\_number](#input\_environment\_number) | The environment count for the respective environment. Defaults to 000. Increments in value of 1 | `string` | `"000"` | no |
| <a name="input_resource_number"></a> [resource\_number](#input\_resource\_number) | The resource count for the respective resource. Defaults to 000. Increments in value of 1 | `string` | `"000"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region in which the infra needs to be provisioned | `string` | `"us-east-2"` | no |
| <a name="input_length"></a> [length](#input\_length) | n/a | `number` | `24` | no |
| <a name="input_number"></a> [number](#input\_number) | n/a | `bool` | `false` | no |
| <a name="input_special"></a> [special](#input\_special) | n/a | `bool` | `false` | no |
| <a name="input_producer_external_id"></a> [producer\_external\_id](#input\_producer\_external\_id) | STS External ID used for the assumption policy when creating the producer role. | `list(string)` | `null` | no |
| <a name="input_producer_trusted_service"></a> [producer\_trusted\_service](#input\_producer\_trusted\_service) | Trusted service used for the assumption policy when creating the producer role. Defaults to the logs service for the current AWS region. | `string` | `null` | no |
| <a name="input_producer_policy_json"></a> [producer\_policy\_json](#input\_producer\_policy\_json) | Policy JSON containing rights for the producer role. If not specified, will build a producer policy for CloudWatch Logs. | `string` | `null` | no |
| <a name="input_consumer_trusted_services"></a> [consumer\_trusted\_services](#input\_consumer\_trusted\_services) | Trusted service used for the assumption policy when creating the consumer role. Defaults to the firehose service. | `string` | `null` | no |
| <a name="input_consumer_external_id"></a> [consumer\_external\_id](#input\_consumer\_external\_id) | STS External ID used for the assumption policy when creating the consumer role. Defaults to the current AWS account ID. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources created by the module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the metric stream. |
| <a name="output_creation_date"></a> [creation\_date](#output\_creation\_date) | Date and time in RFC3339 format that the metric stream was created. |
| <a name="output_last_update_date"></a> [last\_update\_date](#output\_last\_update\_date) | Date and time in RFC3339 format that the metric stream was updated. |
| <a name="output_state"></a> [state](#output\_state) | State of the metric stream. Possible values are running and stopped. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
