require "rails_helper"

RSpec.describe StickiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stickies").to route_to("stickies#index")
    end

    it "routes to #new" do
      expect(:get => "/stickies/new").to route_to("stickies#new")
    end

    it "routes to #show" do
      expect(:get => "/stickies/1").to route_to("stickies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stickies/1/edit").to route_to("stickies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stickies").to route_to("stickies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/stickies/1").to route_to("stickies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/stickies/1").to route_to("stickies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stickies/1").to route_to("stickies#destroy", :id => "1")
    end

  end
end
