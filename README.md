# terraform-aws-cloudfront-s3

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-cloudfront-s3/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-cloudfront-s3)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-cloudfront-s3.svg)](https://github.com/JamesWoolfenden/terraform-aws-cloudfront-s3/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-cloudfront-s3.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-cloudfront-s3/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-cloudfront-s3/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-cloudfront-s3&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-cloudfront-s3/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-cloudfront-s3&benchmark=INFRASTRUCTURE+SECURITY)

This Terraform module is to provision a private S3 bucket, and use it as a static website, and sit that behind a Cloudfront distribution.
Certificate needs a delay adding before cloudfront uses it, until then run it twice.

## Usage

Creates a static site with cloudfront distribution in front.

![alt text](./diagram/static_site.png)

To use, add **module.cloudfront.tf** to your template and update your variables and values, see _example/examplea_ for a full worked example.

```hcl
module "cloudfront" {
  source       = "JamesWoolfenden/cloudfront-s3/aws"
  version      = "0.3.2"
  common_tags = var.common_tags
  bucket_name = var.bucket_name
}
```

## Costs

```text
 Monthly cost estimate

Project: .

 Name                                                                       Monthly Qty  Unit                Monthly Cost

 module.cloudfront.aws_acm_certificate.cert
 └─ Certificate                                                                       1  requests                   $0.75

 module.cloudfront.aws_cloudfront_distribution.website
 ├─ Field level encryption requests                                     Cost depends on usage: $0.02 per 10k requests
 ├─ Real-time log requests                                              Cost depends on usage: $0.01 per 1M lines
 ├─ Dedicated IP custom SSLs                                            Cost depends on usage: $600.00 per certificates
 ├─ Invalidation requests (first 1k)                                    Cost depends on usage: $0 per paths
 ├─ Data transfer out to internet
 │  ├─ US, Mexico, Canada (first 10TB)                                  Cost depends on usage: $0.09 per GB
 │  ├─ Europe, Israel (first 10TB)                                      Cost depends on usage: $0.09 per GB
 │  ├─ South Africa, Kenya, Middle East (first 10TB)                    Cost depends on usage: $0.11 per GB
 │  ├─ South America (first 10TB)                                       Cost depends on usage: $0.11 per GB
 │  ├─ Japan (first 10TB)                                               Cost depends on usage: $0.11 per GB
 │  ├─ Australia, New Zealand (first 10TB)                              Cost depends on usage: $0.11 per GB
 │  ├─ Hong Kong, Philippines, Asia Pacific (first 10TB)                Cost depends on usage: $0.12 per GB
 │  └─ India (first 10TB)                                               Cost depends on usage: $0.11 per GB
 ├─ Data transfer out to origin
 │  ├─ US, Mexico, Canada                                               Cost depends on usage: $0.02 per GB
 │  ├─ Europe, Israel                                                   Cost depends on usage: $0.02 per GB
 │  ├─ South Africa, Kenya, Middle East                                 Cost depends on usage: $0.06 per GB
 │  ├─ South America                                                    Cost depends on usage: $0.13 per GB
 │  ├─ Japan                                                            Cost depends on usage: $0.06 per GB
 │  ├─ Australia, New Zealand                                           Cost depends on usage: $0.08 per GB
 │  ├─ Hong Kong, Philippines, Asia Pacific                             Cost depends on usage: $0.06 per GB
 │  └─ India                                                            Cost depends on usage: $0.16 per GB
 ├─ HTTP requests
 │  ├─ US, Mexico, Canada                                               Cost depends on usage: $0.0075 per 10k requests
 │  ├─ Europe, Israel                                                   Cost depends on usage: $0.009 per 10k requests
 │  ├─ South Africa, Kenya, Middle East                                 Cost depends on usage: $0.009 per 10k requests
 │  ├─ South America                                                    Cost depends on usage: $0.02 per 10k requests
 │  ├─ Japan                                                            Cost depends on usage: $0.009 per 10k requests
 │  ├─ Australia, New Zealand                                           Cost depends on usage: $0.009 per 10k requests
 │  ├─ Hong Kong, Philippines, Asia Pacific                             Cost depends on usage: $0.009 per 10k requests
 │  └─ India                                                            Cost depends on usage: $0.009 per 10k requests
 ├─ HTTPS requests
 │  ├─ US, Mexico, Canada                                               Cost depends on usage: $0.01 per 10k requests
 │  ├─ Europe, Israel                                                   Cost depends on usage: $0.01 per 10k requests
 │  ├─ South Africa, Kenya, Middle East                                 Cost depends on usage: $0.01 per 10k requests
 │  ├─ South America                                                    Cost depends on usage: $0.02 per 10k requests
 │  ├─ Japan                                                            Cost depends on usage: $0.01 per 10k requests
 │  ├─ Australia, New Zealand                                           Cost depends on usage: $0.01 per 10k requests
 │  ├─ Hong Kong, Philippines, Asia Pacific                             Cost depends on usage: $0.01 per 10k requests
 │  └─ India                                                            Cost depends on usage: $0.01 per 10k requests
 └─ Origin shield HTTP requests
    ├─ US                                                               Cost depends on usage: $0.0075 per 10k requests
    ├─ Europe                                                           Cost depends on usage: $0.009 per 10k requests
    ├─ South America                                                    Cost depends on usage: $0.02 per 10k requests
    ├─ Japan                                                            Cost depends on usage: $0.009 per 10k requests
    ├─ Australia                                                        Cost depends on usage: $0.009 per 10k requests
    ├─ Singapore                                                        Cost depends on usage: $0.009 per 10k requests
    ├─ South Korea                                                      Cost depends on usage: $0.009 per 10k requests
    └─ India                                                            Cost depends on usage: $0.009 per 10k requests

 module.cloudfront.aws_route53_record.cert_validation["freebeer.site"]
 ├─ Standard queries (first 1B)                                         Cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)                            Cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                                          Cost depends on usage: $0.70 per 1M queries

 module.cloudfront.aws_s3_bucket.logging
 └─ Standard
    ├─ Storage                                                          Cost depends on usage: $0.02 per GB-months
    ├─ PUT, COPY, POST, LIST requests                                   Cost depends on usage: $0.0053 per 1k requests
    ├─ GET, SELECT, and all other requests                              Cost depends on usage: $0.00042 per 1k requests
    ├─ Select data scanned                                              Cost depends on usage: $0.00225 per GB-months
    └─ Select data returned                                             Cost depends on usage: $0.0008 per GB-months

 module.cloudfront.aws_s3_bucket.website
 └─ Standard
    ├─ Storage                                                          Cost depends on usage: $0.02 per GB-months
    ├─ PUT, COPY, POST, LIST requests                                   Cost depends on usage: $0.0053 per 1k requests
    ├─ GET, SELECT, and all other requests                              Cost depends on usage: $0.00042 per 1k requests
    ├─ Select data scanned                                              Cost depends on usage: $0.00225 per GB-months
    └─ Select data returned                                             Cost depends on usage: $0.0008 per GB-months

 PROJECT TOTAL                                                                                                      $0.75
```

The default TTL values have been set very low, you will override these (but oh so helpful for development), for a more effective cache.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.14.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.6.0 |
| <a name="provider_aws.useastone"></a> [aws.useastone](#provider\_aws.useastone) | 4.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.cert](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/acm_certificate_validation) | resource |
| [aws_cloudfront_distribution.website](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.website](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_cloudfront_response_headers_policy.pass](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/cloudfront_response_headers_policy) | resource |
| [aws_route53_record.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/route53_record) | resource |
| [aws_route53_record.cloudfront](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/route53_record) | resource |
| [aws_s3_bucket.logging](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.website](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.logging](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_acl.website](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_cors_configuration.website](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.logging](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.website](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_policy.cloudfront](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.logging](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.logging](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.logging](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_versioning.website](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_website_configuration.website](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_s3_object.index](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/resources/s3_object) | resource |
| [aws_iam_policy_document.cloudfront](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/data-sources/iam_policy_document) | data source |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/4.6.0/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_log_bucket"></a> [access\_log\_bucket](#input\_access\_log\_bucket) | Name of your access logging bucket | `string` | `"logging"` | no |
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | The ARN of the certificate to be used | `string` | `""` | no |
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | n/a | `string` | `"Private"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | name of the bucket | `string` | n/a | yes |
| <a name="input_cloudfront_default_certificate"></a> [cloudfront\_default\_certificate](#input\_cloudfront\_default\_certificate) | use default SSL certificate | `bool` | `false` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Implements the common tags scheme | `map(any)` | n/a | yes |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | default ttl values | `number` | `90` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | n/a | `bool` | `true` | no |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | The fully qualified domain Name | `string` | n/a | yes |
| <a name="input_header_policy_name"></a> [header\_policy\_name](#input\_header\_policy\_name) | n/a | `string` | n/a | yes |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | n/a | `any` | n/a | yes |
| <a name="input_locations"></a> [locations](#input\_locations) | Locations for the Distribution | `list(any)` | <pre>[<br>  "GB"<br>]</pre> | no |
| <a name="input_max_ttl"></a> [max\_ttl](#input\_max\_ttl) | max ttl values | `number` | `300` | no |
| <a name="input_min_ttl"></a> [min\_ttl](#input\_min\_ttl) | min ttl values | `number` | `30` | no |
| <a name="input_price_class"></a> [price\_class](#input\_price\_class) | n/a | `string` | `"PriceClass_100"` | no |
| <a name="input_restriction_type"></a> [restriction\_type](#input\_restriction\_type) | n/a | `string` | `"whitelist"` | no |
| <a name="input_retain"></a> [retain](#input\_retain) | Do you want to retain the distribution on delete? | `bool` | `false` | no |
| <a name="input_sse_algorithm"></a> [sse\_algorithm](#input\_sse\_algorithm) | The type of encryption algorithm to use | `string` | `"aws:kms"` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | n/a | `string` | `"300"` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Switch to control versioning | `string` | `"Enabled"` | no |
| <a name="input_web_acl_id"></a> [web\_acl\_id](#input\_web\_acl\_id) | The id of the WAF | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The route53 zone to use | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_distribution"></a> [distribution](#output\_distribution) | n/a |
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
| <a name="output_logging"></a> [logging](#output\_logging) | n/a |
| <a name="output_policy"></a> [policy](#output\_policy) | n/a |
| <a name="output_website"></a> [website](#output\_website) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Checkov Exclusion

I have added:

```checkov
  #checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  #checkov:skip=CKV_AWS_19: "Ensure all data stored in the S3 bucket is securely encrypted at rest"
```

As we will want to deploy to this bucket and it needs to be readable to the world if it's a website.
There are also some exceptions on the logging bucket, e.g. logging of the logging bucket.

## new checks

Address
<https://github.com/bridgecrewio/checkov/issues/146>

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-cloudfront-s3/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-cloudfront-s3/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-certificate-authority&url=https://github.com/JamesWoolfenden/terraform-aws-certificate-authority
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-certificate-authority&url=https://github.com/JamesWoolfenden/terraform-aws-certificate-authority
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-certificate-authority
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-certificate-authority
[share_email]: mailto:?subject=terraform-aws-certificate-authority&body=https://github.com/JamesWoolfenden/terraform-aws-certificate-authority
