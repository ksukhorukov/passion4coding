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

  describe "POST /verticals" do
    it "verticals creation" do
    	vertical_name = FFaker::Lorem.sentence
    	vertical = Vertical.new(name: vertical_name)
    	params = vertical.attributes
      post verticals_path(params)
      expect(response).to have_http_status(201)
    end
  end

  describe "UPDATE /verticals" do
    it "verticals update" do
    	vertical_name = FFaker::Lorem.sentence
    	vertical = Vertical.create(name: vertical_name)
    	params = vertical.attributes
    	params[:name] = 'patched name'
    	patch "/verticals/#{vertical.id}", params: params
      response.should be_successful
      expect(JSON.parse(response.body)['Name']) == params[:name]
    end
  end

  describe "SHOW /verticals" do
    it "verticals show" do
    	vertical_name = FFaker::Lorem.sentence
    	vertical = Vertical.create(name: vertical_name)
    	params = vertical.attributes
    	params[:name] = 'patched name'
    	get "/verticals/#{vertical.id}"
      response.should be_successful
      expect(JSON.parse(response.body)['Name']) == params[:name]
    end
  end

  describe "DESTROY /verticals" do
    it "verticals show" do
    	vertical_name = FFaker::Lorem.sentence
    	vertical = Vertical.create(name: vertical_name)
    	params = vertical.attributes
    	params[:name] = 'patched name'
    	delete "/verticals/#{vertical.id}"
      response.should be_successful
      expect(Vertical.count) == 0
    end
  end
end
