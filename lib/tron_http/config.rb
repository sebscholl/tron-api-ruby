# frozen_string_literal: true

require "uri"

# TronHttp
module TronHttp
  # Config
  class Config
    def self.hostnames
      TronHttp::DATA["hostnames"]
    end

    def self.endpoints
      TronHttp::DATA["endpoints"]
    end

    def self.scaffold
      define_network_methods
      define_endpoint_methods
    end

    def self.define_network_methods
      hostnames.each_key do |network|
        TronHttp.define_singleton_method(network) do
          Client.new network
        end
      end
    end

    def self.define_endpoint_methods
      endpoints.each do |endpoint, options|
        path = options["path"]
        method = options["method"]
        variables = options["variables"]

        Client.define_method(endpoint) do |params = {}|
          Helpers.validate_variables variables, params
          HTTP.send method, URI(@hostname + path), params
        end
      end
    end
  end
end
