module "datadog_configuration" {
  source                  = "github.com/cloudposse-terraform-components/aws-datadog-credentials?ref=v1.535.1"
  version                 = "1.535.1"
  enabled                 = true
  context                 = module.this.context
  global_environment_name = var.datadog_configuration_environment
}

provider "datadog" {
  api_key  = module.datadog_configuration.datadog_api_key
  app_key  = module.datadog_configuration.datadog_app_key
  api_url  = module.datadog_configuration.datadog_api_url
  validate = local.enabled
}
