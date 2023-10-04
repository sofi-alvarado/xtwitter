require 'rails_helper'

RSpec.describe "Web::Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/web/users/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/web/users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/web/users/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/web/users/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/web/users/create"
      expect(response).to have_http_status(:success)
    end
  end

end
