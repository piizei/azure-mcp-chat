data "namep_azure_caf_types" "main" {}
data "namep_azure_locations" "main" {}

resource "random_string" "rnd" {
  length  = 4
  special = false
  upper   = false
}

data "namep_configuration" "main" {
  types         = data.namep_azure_caf_types.main.types
  variable_maps = data.namep_azure_locations.main.location_maps
  formats = {
    azure_nodashes        = "#{SLUG}#{APP}#{ENV}#{LOCS[LOC]}#{NAME}#{SALT}"
    azure_nodashes_global = "#{SLUG}#{APP}#{ENV}#{LOCS[LOC]}#{RND}#{SALT}"
    azure_dashes          = "#{SLUG}-#{APP}-#{ENV}-#{LOCS[LOC]}-#{NAME}#{-SALT}"
    azure_dashes_global   = "#{SLUG}-#{APP}-#{ENV}-#{LOCS[LOC]}-#{RND}#{-SALT}"
    azuread_application   = "#{APP}-#{ENV}-#{LOCS[LOC]}-#{NAME}#{-SALT}"
  }
}

locals {
  namep_config = merge(data.namep_configuration.main.configuration,
    {
      variables = {
        name = "main"
        env  = var.environment
        app  = var.app_name
        salt = var.salt
        loc  = var.location
        rnd  = random_string.rnd.result
      }
    }
  )
}
