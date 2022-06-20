terraform {
}

provider "aws" {
  region = "ap-northeast-1"
}

module "batch" {
  source                 = "./modules/lambda"
  servicename            = "test"             # 適当な名前
  local_existing_package = "../bootstrap.zip" # `make build` で作ったデプロイパッケージ
}

output "lambda_function_url" {
  value = module.batch.lambda_function_url
}
