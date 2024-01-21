require_relative './tron_http'

module TronHttp
  class Client
    attr_reader :options, :hostname
    #
    # Initialize TronHttp::Client with network and options
    # defaults to Shasta network.
    #
    def initialize(network = 'shasta')
      @hostname = hostname_for(network)
    end

    private

    def hostname_for(network)
      hostname = TronHttp::NETWORKS[network]

      raise "Network #{network} not found." unless hostname

      hostname
    end
  end
end
