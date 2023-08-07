require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:bookmark) }
    it { should belong_to(:original_tweet) }
    it { should have_many(:taggings) }
    it { should have_many(:hashtags).through(:taggings) }
    it { should have_many(:replies) } 
    it { should have_many(:likes)}
    it { should have_many(:retweets) } 
  end
  
  context "methods" do
    expect(subject).to respond_to(:retweet?)
  end

  describe "validations" do
    it { should validate_length_of(:body).is_at_most(255) }

    context "if tweet or quote" do
      before {allow(subject).to receive(:retweet?).and_return(false)}
      it { should validate_presence_of(:body) }
    end
    
    context "if retweet" do
      before {allow(subject).to receive(:retweet?).and_return(true)}
      it { should_not validate_presence_of(:body) }
    end
    
  end
end
