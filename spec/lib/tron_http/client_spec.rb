# frozen_string_literal: true

require "spec_helper"

RSpec.describe TronHttp::Client do
  describe "Client" do
    context "initialze" do
      it "initializes a new client instance with default" do
        expect(TronHttp::Client.new).to be_a(TronHttp::Client)
      end

      it "initializes a new client instance with specified network" do
        expect(
          TronHttp::Client.new("mainnet").hostname
        ).to(
          eq TronHttp::Config.hostnames["mainnet"]
        )
      end
    end
  end
end
