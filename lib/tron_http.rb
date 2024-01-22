# frozen_string_literal: true

require "yaml"
require_relative "tron_http/version"

# TronHttp
module TronHttp
  require_relative "tron_http/http"
  require_relative "tron_http/config"
  require_relative "tron_http/client"
  require_relative "tron_http/helpers"

  DATA = YAML.load_file(
    File.join(__dir__, "data/tron.yml")
  )
  Config.scaffold
end
