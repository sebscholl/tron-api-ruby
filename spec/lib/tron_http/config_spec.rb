# frozen_string_literal: true

require "spec_helper"

RSpec.describe TronHttp::Config do
  describe "Config" do
    context "hostnames" do
      it "returns a hash" do
        expect(TronHttp::Config.hostnames).to be_a(Hash)
      end

      it "returns the hostnames from the YAML file" do
        expect(TronHttp::Config.hostnames).to eq(TronHttp::DATA["hostnames"])
      end
    end

    context "endpoints" do
      it "returns a hash" do
        expect(TronHttp::Config.endpoints).to be_a(Hash)
      end

      it "returns the endpoints from the YAML file" do
        expect(TronHttp::Config.endpoints).to eq(TronHttp::DATA["endpoints"])
      end
    end
  end
end
