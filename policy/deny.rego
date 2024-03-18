package main

deny[msg] {
	resource := input.resource.aws_s3_bucket[id]
	resource.versioning != null
	msg = sprintf("aws_s3_bucket.%v [bucket: %v] has versioning defined", [id, resource.bucket])
}

deny[msg] {
	resource := input.resource.aws_s3_bucket[id]
	not has_versioning_resource(resource.bucket)
	msg := sprintf("aws_s3_bucket.%v [bucket: %v] has no associated aws_s3_bucket_versioning resource", [id, resource.bucket])
}

deny[msg] {
	resource := input.resource.aws_s3_bucket_versioning[id]
	resource.versioning_configuration.status != "Enabled"
    unformatted_msg = "aws_s3_bucket_versioning.%v [bucket: %v] has disabled versioning"
	msg := sprintf(unformatted_msg, [id, resource.bucket])
}

has_versioning_resource(bucket) {
	versioning := input.resource.aws_s3_bucket_versioning[id]
    versioning.bucket == bucket
}