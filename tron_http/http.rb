require 'uri'
require 'json'
require 'irb'
require 'net/http'

module TronHttp
  module HTTP
    # Make a GET request.
    def self.POST(uri, params = {})
      http = set_http(uri, 443)

      request = Net::HTTP::Get.new(uri)
      request = set_headers(request)

      response = http.request(request)
      JSON.parse response.body
    end

    # Make a POST request.
    def self.GET(uri, params = {})
      http = set_http(uri, 443)

      request = Net::HTTP::Post.new(uri)
      request = set_headers(request)
      request.body = JSON.generate(params)

      response = http.request(request)
      JSON.parse response.body
    end

    private

    # Set the HTTP request
    def self.set_http(uri, port)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      http
    end

    # Set request headers
    def self.set_headers(request)
      request["accept"] = 'application/json'
      request["content-type"] = 'application/json'

      request
    end
  end
end
