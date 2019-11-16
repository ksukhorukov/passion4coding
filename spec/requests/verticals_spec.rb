require 'rails_helper'

RSpec.describe "Verticals", type: :request do
  describe "GET /verticals" do
    it "verticals index" do
    	vertical_name = FFaker::Lorem.sentence
    	vertical = Vertical.create(name: vertical_name)
      get verticals_path
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).first["Name"]).to eq(vertical_name)
    end
  end
end
