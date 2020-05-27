[![Slalom][logo]](https://slalom.com)

# terraform-aws-cloudfront-s3

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-cloudfront-s3/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-cloudfront-s3)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-cloudfront-s3.svg)](https://github.com/JamesWoolfenden/terraform-aws-cloudfront-s3/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

Terraform module to provision a website that sits behind a cloudfront distribution.

## Usage

Creates a static site with cloudfront distribution in front

```hcl
module "cloudfront" {
  source       = "JamesWoolfenden/certificate-authority/aws"
  version      = "0.2.12"
  common_tags  = var.common_tags
  domain       = var.domain
}
```

The default ttl values have been set very low, you will override these, for a more effective cache.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| access\_log\_bucket | Name of your access logging bucket | `string` | `"logging"` | no |
| acm\_certificate\_arn | The ARN of the certificate to be used | `string` | `""` | no |
| bucket\_acl | n/a | `string` | `"Private"` | no |
| bucket\_name | name of the bucket | `string` | n/a | yes |
| cloudfront\_default\_certificate | use default SSL certificate | `bool` | `true` | no |
| common\_tags | Implements the common tags scheme | `map` | n/a | yes |
| default\_ttl | default ttl values | `number` | `90` | no |
| force\_destroy | n/a | `bool` | `true` | no |
| locations | Locations for the Distribution | `list` | <pre>[<br>  "GB"<br>]</pre> | no |
| max\_ttl | max ttl values | `number` | `300` | no |
| min\_ttl | min ttl values | `number` | `30` | no |
| price\_class | n/a | `string` | `"PriceClass_100"` | no |
| ttl | n/a | `string` | `"300"` | no |
| versioning | Switch to control versioning | `bool` | `true` | no |
| web\_acl\_id | If a WAF is being used - the Id of the AWS WAF web ACL that is associated with the distribution | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket | n/a |
| distribution | n/a |
| identity | n/a |
| logging | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Checkov Exclusion

I have added:

```checkov
  #checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  #checkov:skip=CKV_AWS_19: "Ensure all data stored in the S3 bucket is securely encrypted at rest"
```

As we will want to deploy to this bucket and it needs to be readable to the world if it's a website.

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

Copyright © 2019-2020 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-certificate-authority&url=https://github.com/JamesWoolfenden/terraform-aws-certificate-authority
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-certificate-authority&url=https://github.com/JamesWoolfenden/terraform-aws-certificate-authority
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-certificate-authority
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-certificate-authority
[share_email]: mailto:?subject=terraform-aws-certificate-authority&body=https://github.com/JamesWoolfenden/terraform-aws-certificate-authority
