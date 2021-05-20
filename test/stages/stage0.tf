module "kms_key" {
  # source           = "git::ssh://git@github.com/slzone/terraform-ibm-hpcs-kms.key.git"
  source             = "git::ssh://git@github.com/slzone/terraform-ibm-hpcs-kms-key.git?ref=hpcs-kms-dev"
  ibmcloud_api_key   = var.ibmcloud_api_key
  name               = var.name
  standard_key       = var.standard_key
  hpcs_instance_guid = var.hpcs_instance_guid
  force_delete       = var.force_delete
  endpoint_type      = var.endpoint_type
  key_material       = var.key_material
  encrypted_nonce    = var.encrypted_nonce
  iv_value           = var.iv_value
  expiration_date    = var.expiration_date
  interval_month     = var.interval_month
  dual_auth_delete   = var.dual_auth_delete
  region             = var.region
  hpcs_port          = var.hpcs_port
}
