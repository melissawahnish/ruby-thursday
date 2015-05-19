require "rails_helper"

RSpec.describe StarshipsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/starships").to route_to("starships#index")
    end

    it "routes to #new" do
      expect(:get => "/starships/new").to route_to("starships#new")
    end

    it "routes to #show" do
      expect(:get => "/starships/1").to route_to("starships#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/starships/1/edit").to route_to("starships#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/starships").to route_to("starships#create")
    end

    it "routes to #update" do
      expect(:put => "/starships/1").to route_to("starships#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/starships/1").to route_to("starships#destroy", :id => "1")
    end

  end
end
