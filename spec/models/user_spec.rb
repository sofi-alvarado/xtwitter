require 'rails_helper'
# Model test
RSpec.describe User, type: :model do

  context "associations" do
    it { should have_many(:follows_as_following).class_name('Follow').with_foreign_key('following_user_id') }
    it { should have_many(:follows_as_follower).class_name('Follow').with_foreign_key('follower_user_id')  } 
    it { should have_many(:tweets) }
    it { should have_many(:replies) }
    it { should have_many(:bookmarks) }
    it { should have_many(:likes) }
  end

  context "unique username and email" do 
      it { should validate_uniqueness_of(:email)}
      it { should validate_uniqueness_of(:username)}
  end

  context "validations" do
      it { should validate_presence_of(:name).with_message("needs to have a value") }
      it { should validate_presence_of(:username).with_message("needs to have a value")  }
      it { should validate_presence_of(:email).with_message("needs to have a value")  }
      it { should validate_presence_of(:password).with_message("needs to have a value")  }
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
  
    it 'returns users who are followers of the specified user' do
      user = create(:user)
      follower = create(:user)
      Follow.create(follower_user: follower, following_user: user)
      expect(User.joins(:follows_as_follower).where(follows: { following_user_id: user.id })).to include(follower)
    end

    it 'returns users who are being followed by the specified user' do
      user = create(:user)
      following = create(:user)
      Follow.create(follower_user: user, following_user: following)
      expect(User.joins(:follows_as_following).where(follows: { follower_user_id: user.id })).to include(following)
    end

    it 'returns the count of followers for the specified user' do
      user = create(:user)
      follower1 = create(:user)
      follower2 = create(:user)
      Follow.create(follower_user: follower1, following_user: user)
      Follow.create(follower_user: follower2, following_user: user)
      expect(User.joins(:follows_as_follower).where(follows: { following_user_id: user.id }).count).to eq(2)
    end

    it 'returns the count of followings for the specified user' do
      user = create(:user)
      following1 = create(:user)
      following2 = create(:user)
      Follow.create(follower_user: user, following_user: following1)
      Follow.create(follower_user: user, following_user: following2)
      expect(User.joins(:follows_as_following).where(follows: { follower_user_id: user.id }).count).to eq(2)
    end

  end

end



=begin
    it 'returns users who are followers of the specified user' do
      user = create(:user)
      follower = create(:user)
      user.follows_as_follower.create(following_user: follower)
      expect(User.joins(:follows_as_follower).where(follows: { following_user_id: user.id })).to include(follower)
    end

    it 'returns users who are being followed by the specified user' do
      user = create(:user)
      following = create(:user)
      user.follows_as_following.create(follower_user: following)
      expect(User.joins(:follows_as_following).where(follows: { follower_user_id: user.id })).to include(following)
    end

    it 'returns the count of followers for the specified user' do
      user = create(:user)
      follower1 = create(:user)
      follower2 = create(:user)
      user.follows_as_follower.create(following_user: [follower1, follower2])
      expect(User.joins(:follows_as_follower).where(follows: { following_user_id: user.id }).count).to eq(2)
    end

    it 'returns the count of followings for the specified user' do
      user = create(:user)
      following1 = create(:user)
      following2 = create(:user)
      user.follows_as_following.create(follower_user: [following1, following2])
      expect(User.joins(:follows_as_following).where(follows: { follower_user_id: user.id }).count).to eq(2)
    end

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
