# frozen_string_literal: true

require_relative './tron_http'

# TronHttp
module TronHttp
  #
  # TronHttp::Client
  # The main class for interacting with the Tron API.
  #
  class Client
    attr_reader :hostname

    def initialize(network = 'shasta')
      @hostname = hostname_for(network)
    end

    private

    def hostname_for(network)
      hostname = TronHttp::Config.hostnames[network]

      raise "Network #{network} not found." unless hostname

      hostname
    end
  end
end
