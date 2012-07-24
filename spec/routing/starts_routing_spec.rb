require "spec_helper"

describe StartsController do
  describe "routing" do

    it "routes to #index" do
      get("/starts").should route_to("starts#index")
    end

    it "routes to #new" do
      get("/starts/new").should route_to("starts#new")
    end

    it "routes to #show" do
      get("/starts/1").should route_to("starts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/starts/1/edit").should route_to("starts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/starts").should route_to("starts#create")
    end

    it "routes to #update" do
      put("/starts/1").should route_to("starts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/starts/1").should route_to("starts#destroy", :id => "1")
    end

  end
end
