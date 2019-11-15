require "rails_helper"

RSpec.describe VerticalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/verticals").to route_to("verticals#index")
    end

    it "routes to #show" do
      expect(:get => "/verticals/1").to route_to("verticals#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/verticals").to route_to("verticals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/verticals/1").to route_to("verticals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/verticals/1").to route_to("verticals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/verticals/1").to route_to("verticals#destroy", :id => "1")
    end
  end
end
