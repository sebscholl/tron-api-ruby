module TronHttp
  module Setup
    @@config = nil

    def self.run(config)
      @@config = config

      set_hostnames
      set_endpoints
    end

    private

    # Set hostnames for the API
    def self.set_hostnames
      TronHttp::NETWORKS.merge! @@config['hostnames']
    end

    # Set endpoint methods for the API
    def self.set_endpoints
      @@config['endpoints'].each { |endpoint, options| set_endpoint(endpoint, options) }
    end

    # Set endpoint
    def self.set_endpoint(endpoint, options)
      TronHttp::Client.send :define_method, endpoint do |params = {}|
        # Validate variables will raise an error if the variables are not valid.
        TronHttp::Helpers.validate_variables options['variables'], params
        TronHttp::HTTP.send options['method'], URI(@hostname + options['path']), params
      end
    end
  end
end
