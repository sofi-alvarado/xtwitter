require 'rails_helper'

RSpec.describe "::TweetsController", type: :request do
  describe "GET /tweets" do
    it "works! (now write some real specs)" do
      get _tweets_index_path
      expect(response).to have_http_status(200)
    end
  end
end
