require 'rails_helper'

RSpec.describe Tagging, type: :model do
  context "association" do
    it { should belong_to(:hashtag) } 
    it { should belong_to(:tweet) } 
  end

  context "validations" do
    it { should validate_presence_of(:hashtag_id) }
    it { should validate_presence_of(:tweet_id) }
    it { should validate_uniqueness_of(:tweet_id).scoped_to(:hashtag_id) }
  end
end
