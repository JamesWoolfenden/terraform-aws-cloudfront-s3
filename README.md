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

The default ttl values have been set very low, you will override these (but oh so helpful for development), for a more effective cache.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| aws.useastone | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_acm_certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) |
| [aws_acm_certificate_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) |
| [aws_cloudfront_distribution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) |
| [aws_cloudfront_origin_access_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_route53_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) |
| [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) |
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) |
| [aws_s3_bucket_object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) |
| [aws_s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_log\_bucket | Name of your access logging bucket | `string` | `"logging"` | no |
| acm\_certificate\_arn | The ARN of the certificate to be used | `string` | `""` | no |
| bucket\_acl | n/a | `string` | `"Private"` | no |
| bucket\_name | name of the bucket | `string` | n/a | yes |
| cloudfront\_default\_certificate | use default SSL certificate | `bool` | `false` | no |
| common\_tags | Implements the common tags scheme | `map(any)` | n/a | yes |
| default\_ttl | default ttl values | `number` | `90` | no |
| force\_destroy | n/a | `bool` | `true` | no |
| fqdn | The fully qualified domain Name | `string` | n/a | yes |
| locations | Locations for the Distribution | `list(any)` | <pre>[<br>  "GB"<br>]</pre> | no |
| max\_ttl | max ttl values | `number` | `300` | no |
| min\_ttl | min ttl values | `number` | `30` | no |
| price\_class | n/a | `string` | `"PriceClass_100"` | no |
| restriction\_type | n/a | `string` | `"whitelist"` | no |
| retain | Do you want to retain the distribution on delete? | `bool` | `false` | no |
| sse\_algorithm | The type of encryption algorithm to use | `string` | `"aws:kms"` | no |
| ttl | n/a | `string` | `"300"` | no |
| versioning | Switch to control versioning | `bool` | `true` | no |
| web\_acl\_id | If a WAF is being used - the Id of the AWS WAF web ACL that is associated with the distribution | `string` | `""` | no |
| zone | The route53 zone to use | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| distribution | n/a |
| identity | n/a |
| logging | n/a |
| policy | n/a |
| website | n/a |
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

Copyright © 2019-2021 James Woolfenden

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
