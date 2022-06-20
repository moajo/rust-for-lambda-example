terraform {
}

provider "aws" {
  region = "ap-northeast-1"
}

module "batch" {
  source                 = "./modules/lambda"
  servicename            = "test"
  local_existing_package = "../bootstrap.zip"
}

output "lambda_function_url" {
  value = module.batch.lambda_function_url
}
