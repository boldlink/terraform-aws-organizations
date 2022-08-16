### Required variables
variable "email" {
  type        = string
  description = "Email address of the owner to assign to the new member account. This email address must not already be associated with another AWS account."
  default     = null
}

variable "name" {
  type        = string
  description = "Friendly name for the member account."
  default     = null
}

variable "close_on_deletion" {
  type        = bool
  description = "If true, a deletion event will close the account. Otherwise, it will only remove from the organization. This is not supported for GovCloud accounts."
  default     = false
}

### Optional variables
variable "create_govcloud" {
  type        = bool
  description = "Whether to also create a GovCloud account. The GovCloud account is tied to the main (commercial) account this resource creates. If true, the GovCloud account ID is available in the govcloud_id attribute. The only way to manage the GovCloud account with Terraform is to subsequently import the account using this resource."
  default     = false
}

variable "iam_user_access_to_billing" {
  type        = string
  description = "If set to ALLOW, the new account enables IAM users and roles to access account billing information if they have the required permissions. If set to DENY, then only the root user (and no roles) of the new account can access account billing information. If this is unset, the AWS API will default this to ALLOW. If the resource is created and this option is changed, it will try to recreate the account. Valid values `ALLOW` and `DENY`"
  default     = "ALLOW"
}

variable "parent_id" {
  type        = string
  description = "Parent Organizational Unit ID or Root ID for the account. Defaults to the Organization default Root ID. A configuration must be present for this argument to perform drift detection."
  default     = null
}

variable "role_name" {
  type        = string
  description = "The name of an IAM role that Organizations automatically preconfigures in the new member account. This role trusts the root account, allowing users in the root account to assume the role, as permitted by the root account administrator. The role has administrator permissions in the new member account. The Organizations API provides no method for reading this information after account creation, so Terraform cannot perform drift detection on its value and will always show a difference for a configured value after import unless `ignore_changes` is used."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Key-value map of resource tags."
  default     = {}
}

variable "create_organization" {
  type        = bool
  description = "Specify whether to create an organization"
  default     = false
}

variable "make_delegated_administrator" {
  type        = bool
  description = "Specify whether to create delegated_administrator"
  default     = false
}

variable "administrator_service_principal" {
  type        = string
  description = "The service principal of the AWS service for which you want to make the member account a delegated administrator."
  default     = "cloudtrail.amazonaws.com"
}

variable "aws_service_access_principals" {
  type        = list(string)
  description = "List of AWS service principal names for which you want to enable integration with your organization. This is typically in the form of a URL, such as service-abbreviation.amazonaws.com. Organization must have feature_set set to ALL"
  default = [
    "access-analyzer.amazonaws.com",
    "aws-artifact-account-sync.amazonaws.com",
    "backup.amazonaws.com",
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "guardduty.amazonaws.com"
  ]
}

variable "enabled_policy_types" {
  type        = list(string)
  description = "List of Organizations policy types to enable in the Organization Root. Organization must have feature_set set to `ALL`. For additional information about valid policy types (e.g., `AISERVICES_OPT_OUT_POLICY`, `BACKUP_POLICY`, `SERVICE_CONTROL_POLICY`, and `TAG_POLICY`)"
  default = [
    "BACKUP_POLICY",
    "SERVICE_CONTROL_POLICY",
    "TAG_POLICY"
  ]
}

variable "feature_set" {
  type        = string
  description = "Specify `ALL` (default) or `CONSOLIDATED_BILLING`."
  default     = "ALL"
}

variable "ou_name" {
  type        = string
  description = "The name for the organizational unit"
  default     = null
}

variable "ou_parent_id" {
  type        = string
  description = "ID of the parent organizational unit, which may be the root"
  default     = null
}
