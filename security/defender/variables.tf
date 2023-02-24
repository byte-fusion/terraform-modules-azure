variable "defender_plans" {
  description = "Defender Tier Plans"
  type = object({
    tier          = string
    resource_type = string
  })
}