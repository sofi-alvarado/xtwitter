require 'rails_helper'
# Model test
RSpec.describe User, type: :model do
  it 'return user' do
    user = create(:user)
  end

  context "associations" do
    it { should have_many(:follows_as_following).class_name('Follow').with_foreign_key('following_user_id') }
    it { should have_many(:follows_as_follower).class_name('Follow').with_foreign_key('follower_user_id')  } 
    it { should have_many(:tweets) }
    it { should have_many(:replies) }
    it { should have_many(:bookmarks) }
    it { should have_many(:likes) }
  end

  context "unique username and email" do 
    let(:user) { create(:user) }
    subject { user }
      it { should validate_uniqueness_of(:email)}
      it { should validate_uniqueness_of(:username)}
  end

  context "validations" do
      it { should validate_presence_of(:name).with_message("needs to have a value") }
      it { should validate_presence_of(:username).with_message("needs to have a value")  }
      it { should validate_presence_of(:email).with_message("needs to have a value")  }
      it do 
        should validate_length_of(:password).is_at_least(12).on(:user)
      end
  end

  describe 'scopes' do

    it 'tweets_user' do
      user = create(:user)
      tweet = create(:tweet, user: user)
      expect(User.tweets_user(user.id)).to include([user.username, tweet.content])
    end
  end
end



=begin

 describe "scopes" do
    it "returns a list of followers for a user'" do
      user = create(:user)
          create_list(:user, 10).each do |follower|
          create(:follow, follower_user_id: follower, following_user_id: user)
        end
        create(:user)
        followers = followers(user.id)
        expect(followers).to eq(10)
    end
  end

    it 'followers_count' do
      user = create(:user)
      expect(User.followers_count(user.id)).to eq(1)
    end

    it 'followings_count' do
      user = create(:user)
      expect(User.followings_count(user.id)).to eq(1)
    end
=end
