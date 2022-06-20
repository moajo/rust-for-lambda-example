module "lambda" {
  source = "terraform-aws-modules/lambda/aws"

  function_name              = "${var.servicename}-example"
  description                = "This is example"
  handler                    = "dummy"
  runtime                    = "provided.al2"
  create_package             = false
  local_existing_package     = var.local_existing_package
  create_lambda_function_url = true
}

output "lambda_function_url" {
  value = module.lambda.lambda_function_url
}
