require 'rails_helper'

RSpec.describe "VirtualFittings", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/virtual_fittings/index"
      expect(response).to have_http_status(:success)
    end
  end

end
