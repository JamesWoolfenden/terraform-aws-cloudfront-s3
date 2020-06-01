#create website and logging mech

$bucket="private-bucket-jgw-test"
$logging_bucket="$bucket-logging"
aws s3api create-bucket --acl private --bucket $bucket --region eu-west-1 --create-bucket-configuration LocationConstraint=eu-west-1
aws s3api create-bucket --acl private --bucket $logging_bucket --region eu-west-1 --profile personal --create-bucket-configuration LocationConstraint=eu-west-1
aws s3api put-bucket-acl --acl private --bucket $bucket
aws s3api put-bucket-acl --acl log-delivery-write --bucket $logging_bucket
aws s3api put-bucket-logging --bucket $bucket --bucket-logging-status file://logging.json --region eu-west-1
aws s3api put-bucket-versioning --bucket $bucket --versioning-configuration Status=Enabled
aws s3api put-bucket-website --bucket $bucket --website-configuration file://website.json
aws s3api put-bucket-cors --bucket $bucket --cors-configuration file://cors.json
aws s3api put-bucket-lifecycle-configuration --bucket $logging_bucket --lifecycle-configuration  file://lifecycle.json
