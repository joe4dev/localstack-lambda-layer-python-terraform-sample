# LocalStack Lambda: https://docs.localstack.cloud/user-guide/aws/lambda/
# Terraform with LocalStack: https://github.com/localstack/terraform-local

# https://docs.aws.amazon.com/lambda/latest/dg/python-package.html#python-package-native-libraries
# For Python packages without a compatible wheel distribution, you need to build the C/C++ libraries yourself, preferrably using Docker.
install:
	pip install \
	--platform manylinux2014_x86_64 \
	--target=package \
	--implementation cp \
	--python-version 3.12 \
	--only-binary=:all: \
	--upgrade \
	--requirement requirements.txt \
	--target build/my-lambda-layer/python

init:
	tflocal init

deploy:
	tflocal apply --auto-approve

invoke:
	aws --endpoint http://localhost:4566 lambda invoke \
    --function-name my-lambda-function \
    --cli-binary-format raw-in-base64-out \
    --no-cli-pager \
    output.json
	cat output.json

clean:
	rm -rf build
	rm -rf .terraform
	rf -f output.json

.PHONY: install init deploy invoke clean
