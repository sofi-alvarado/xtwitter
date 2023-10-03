require "rails_helper"

RSpec.describe TweetsController, type: :routing do
    describe "routing" do
      it "routes to #index" do
        expect(get: "api/tweets").to route_to("tweets#index")
      end
  
      it "routes to #new" do
        expect(get: "api/tweets/new").to route_to("tweets#new")
      end
  
      it "routes to #show" do
        expect(get: "api/tweets/1").to route_to("tweets#show", id: "1")
      end
  
      it "routes to #edit" do
        expect(get: "api/tweets/1/edit").to route_to("tweets#edit", id: "1")
      end
  
  
      it "routes to #create" do
        expect(post: "api/tweets").to route_to("tweets#create")
      end
  
      it "routes to #update via PUT" do
        expect(put: "api/tweets/1").to route_to("tweets#update", id: "1")
      end
  
      it "routes to #update via PATCH" do
        expect(patch: "api/tweets/1").to route_to("tweets#update", id: "1")
      end
  
      it "routes to #destroy" do
        expect(delete: "api/tweets/1").to route_to("tweets#destroy", id: "1")
      end
    end
end
