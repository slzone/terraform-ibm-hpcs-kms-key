variable "ibmcloud_api_key" {
  type        = string
  description = "api key of the COS bucket"
}

variable "hpcs_instance_guid" {
  description = "GUID of Service Instance"
  type        = string

}
variable "name" {
  description = "Key Name"
  type        = string
}
variable "endpoint_type" {
  description = "Endpoint type of the Key"
  type        = string
  default     = "public"
}
variable "encrypted_nonce" {
  description = "Encrypted_nonce of the Key"
  type        = string
  default     = null
}
variable "iv_value" {
  description = "Iv_value of the Key"
  type        = string
  default     = null
}
variable "key_material" {
  description = "key_material of the Key"
  type        = string
  default     = null
}
variable "expiration_date" {
  description = "Expiration_date of the Key"
  type        = string
  default     = null
}

variable "standard_key" {
  description = "Determines if it is a standard key or not"
  default     = null
  type        = bool
}
variable "force_delete" {
  description = "Determines if it has to be force deleted"
  default     = null
  type        = bool
}

# KMS key policies 

variable "dual_auth_delete" {
  description = "Dual auth deletion policy enabled or not"
  default     = true
  type        = bool
}

variable "interval_month" {
  description = "Specifies the key rotation time interval in months, with a minimum of 1, and a maximum of 12"
  type        = number
  default     = 3
}

variable "region" {
  default     = "us-south"
  type        = string
  description = "Location of HPCS Instance"
}

variable "hpcs_port" {
  description = "HPCS service port"
  type        = number
}
