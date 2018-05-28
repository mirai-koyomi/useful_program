require 'rails_helper'

RSpec.describe "MillsecConverts", type: :request do
  describe "GET /millsec_converts" do
    it "works! (now write some real specs)" do
      get millsec_converts_path
      expect(response).to have_http_status(200)
    end
  end
end
