require "rails_helper"

RSpec.describe MillsecConvertsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/millsec_converts").to route_to("millsec_converts#index")
    end

    it "routes to #new" do
      expect(:get => "/millsec_converts/new").to route_to("millsec_converts#new")
    end

    it "routes to #show" do
      expect(:get => "/millsec_converts/1").to route_to("millsec_converts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/millsec_converts/1/edit").to route_to("millsec_converts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/millsec_converts").to route_to("millsec_converts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/millsec_converts/1").to route_to("millsec_converts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/millsec_converts/1").to route_to("millsec_converts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/millsec_converts/1").to route_to("millsec_converts#destroy", :id => "1")
    end

  end
end
