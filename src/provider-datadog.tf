module "datadog_configuration" {
  source  = "github.com/cloudposse-terraform-components/aws-datadog-credentials/modules/datadog_keys"
  version = "v1.535.0"

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
