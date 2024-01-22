# frozen_string_literal: true

require "json"
require "net/http"

# TronHttp
module TronHttp
  # HTTP
  module HTTP
    def self.get(uri, _params = {})
      http = Net::HTTP.new(uri.host, 443)
      http.use_ssl = true

      request = Net::HTTP::Get.new(uri)

      default_headers(request)

      response = http.request(request)
      JSON.parse response.body
    end

    def self.post(uri, params = {})
      http = Net::HTTP.new(uri.host, 443)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri)
      request.body = JSON.generate(params)

      default_headers(request)

      response = http.request(request)
      JSON.parse response.body
    end

    # Set request default_headers
    def self.default_headers(request)
      request["accept"] = "application/json"
      request["content-type"] = "application/json"
    end
  end
end
