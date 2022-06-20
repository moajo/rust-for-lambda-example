module "lambda" {
  source = "terraform-aws-modules/lambda/aws"

  function_name          = "${var.servicename}-example" # 適当な名前
  description            = "This is example"
  runtime                = "provided.al2"             # rustの場合runtimeは何もいらないので、生amazon linux2なやつを指定する
  handler                = "dummy"                    # runtime=provided.al2ではエントリポイントは固定で `bootstrap` というバイナリになる。この値は使われない。
  create_package         = false                      # 事前ビルドしてるのでfalse
  local_existing_package = var.local_existing_package # 事前ビルド済みのzipパッケージを外から指定

  create_lambda_function_url = true # とりあえずlambda URLで動作確認できるようにしている
}

output "lambda_function_url" {
  value = module.lambda.lambda_function_url
}
