# frozen_string_literal: true

require "spec_helper"

RSpec.describe TronHttp do
  describe "Setup" do
    context "when the TronHttp module loads" do
      it "assigns the DATA constant" do
        expect(TronHttp::DATA).to be_a(Hash)
      end

      it "loads the Config module" do
        expect(TronHttp::Config).to be_a(Module)
      end

      it "loads the Client module" do
        expect(TronHttp::Client).to be_a(Module)
      end

      it "loads the Helpers module" do
        expect(TronHttp::Helpers).to be_a(Module)
      end

      it "loads the HTTP module" do
        expect(TronHttp::HTTP).to be_a(Module)
      end

      it "scaffolds the network clients" do
        expect(TronHttp.mainnet).to be_a(TronHttp::Client)
      end

      it "scaffolds the client endpoints (has_method)" do
        expect(TronHttp.mainnet).to respond_to(:get_account)
      end
    end
  end
end
