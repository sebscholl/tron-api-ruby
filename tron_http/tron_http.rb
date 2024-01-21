require 'uri'
require 'json'
require 'irb'
require 'net/http'

module TronHttp
  # Local Dependencies
  require_relative './http'
  require_relative './setup'
  require_relative './client'

  # Networks are loaded from data/networks.yml
  # during the start of the application.
  NETWORKS = {}
end
