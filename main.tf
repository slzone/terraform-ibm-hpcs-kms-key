resource "ibm_kms_key" "key" {
  instance_id     = var.hpcs_instance_guid
  key_name        = var.name
  standard_key    = (var.standard_key != null ? var.standard_key : false)
  force_delete    = (var.force_delete != null ? var.force_delete : true)
  endpoint_type   = (var.endpoint_type != null ? var.endpoint_type : "public")
  payload         = (var.key_material != null ? var.key_material : null)
  encrypted_nonce = (var.encrypted_nonce != null ? var.encrypted_nonce : null)
  iv_value        = (var.iv_value != null ? var.iv_value : null)
  expiration_date = (var.expiration_date != null ? var.expiration_date : null)

  policies {
    rotation {
      interval_month = var.interval_month
    }
    dual_auth_delete {
      enabled = var.dual_auth_delete
    }
  }
}

# Enable key rotaion policy for the KMS key at HPCS instance level
resource "null_resource" "enable_key_rotaion_policy" {
  provisioner "local-exec" {
    when    = create
    command = "/bin/bash .terraform/modules/kms_key/scripts/key_rotation_policy.sh"

    environment = {
      REGION           = var.region
      HPCS_INSTANCE_ID = var.hpcs_instance_guid
      INTERVAL_MONTH   = var.interval_month
      PORT             = var.hpcs_port
    }
  }
}
