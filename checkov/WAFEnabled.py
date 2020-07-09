from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class WAFEnabled(BaseResourceCheck):
    def __init__(self):
        name = "CloudFront Distribution should have WAF enabled"
        id = "CKV_AWS_999"
        supported_resources = ['aws_cloudfront_distribution']
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if "web_acl_id" in conf.keys():
            if (conf["web_acl_id"][0] != ""):
                return CheckResult.PASSED
            else:
                return CheckResult.FAILED
        else:
            return CheckResult.FAILED



check = WAFEnabled()
