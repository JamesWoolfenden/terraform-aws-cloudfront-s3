# terraform-aws-cloudfront-s3

Creates a static site with cloudfron distribution infrontgit statys

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| common\_tags | Implements the common tags scheme | map | n/a | yes |
| domain | The domain name | string | n/a | yes |
| fqdn | A fully qualified domain name (eg. ostl.dev.fibrenation.net) | string | n/a | yes |
| ttl |  | string | `"300"` | no |
| web\_acl\_name | Web acl name | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
