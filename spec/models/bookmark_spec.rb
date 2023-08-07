require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  context "association" do
    it { should belong_to(:user) } 
    it { should belong_to(:tweet) } 
  end

  context "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:tweet_id) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:tweet_id) }
  end
end
