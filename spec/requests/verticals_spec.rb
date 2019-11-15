require 'rails_helper'

RSpec.describe "Verticals", type: :request do
  describe "GET /verticals" do
    it "works! (now write some real specs)" do
      get verticals_path
      expect(response).to have_http_status(200)
    end
  end
end
