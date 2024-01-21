# frozen_string_literal: true

# TronHttp
module TronHttp
  # Config
  class Config
    # rubocop:disable Style/MutableConstant
    CONFIG = {}
    # rubocop:enable Style/MutableConstant

    def self.run(config)
      CONFIG.merge!(config)

      define_endpoint_methods
    end

    def self.hostnames
      CONFIG['hostnames']
    end

    def self.endpoints
      CONFIG['endpoints']
    end

    def self.define_endpoint_methods
      endpoints.each do |endpoint, options|
        # Method options from the config file
        path = options['path']
        method = options['method']
        variables = options['variables']
        # Define the method
        TronHttp::Client.send(:define_method, endpoint) do |params = {}|
          TronHttp::Helpers.validate_variables variables, params
          TronHttp::HTTP.send method, URI(@hostname + path), params
        end
      end
    end
  end
end
