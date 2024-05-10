# LocalStack Terraform Sample – Lambda Layer in Python

## Requirements

* [LocalStack Pro](https://www.localstack.cloud/)
* [Docker](https://www.docker.com/)
* [tflocal](https://github.com/localstack/terraform-local)
* [awscli](https://aws.amazon.com/cli/)
* [Python](https://www.python.org/)

## Quickstart

1. Provide your [LocalStack Auth Token](https://docs.localstack.cloud/getting-started/auth-token/): `export LOCALSTACK_AUTH_TOKEN=$LOCALSTACK_AUTH_TOKEN`
2. Start LocalStack Pro: `make start`
3. Install Python dependencies: `make install`
4. Initialize Terraform: `make init`
5. Deploy Terraform: `make deploy`
6. Invoke Lambda: `make invoke`
