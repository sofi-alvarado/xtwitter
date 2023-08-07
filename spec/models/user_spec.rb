require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:tweets) }
    it { should have_many(:likes) } 
    it { should have_many(:followers).class_name("Follower").with_foreign_key(:follower_id)}
    it { should have_many(:followees).class_name("Follower").with_foreign_key(:followee_id) } 
    it { should have_many(:replies) }
    it { should have_many(:bookmarks) } 
  end

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe "scopes" do
    let(:user) { create(:user)}
    let(:tweets) { create_list(:tweet, 5, user: user)}
    let(:replies) { tweets.map{ |tweet| create(:reply, tweet: tweet, user: user)}  }

    describe "tweets" do
      it "should return #{tweets.count}  tweets" do
        expect(user.tweets.count).to be(tweet.count)
      end
    end

    describe "tweets_and_replies" do
      it "should return #{tweets.count + replies.count}  results" do
        expect(user.tweets_and_replies.count).to be(tweet.count + replies.count)
      end
    end

    describe "follower stats" do
      let!(:followers) {
        follower_users = create_list(:user, 5)
        follower_users.map do |follower|
          create(:follower, followee_id: user.id, follower_id: follower.id).follower
        end
      }
      it "should return the total amount of followers"
        expect(user.followers_count).to be(followers.count)
      end
    end

    describe "followees stats" do
      it "should return the total amount of followees" do
        let!(:followees) {
          followee_users = create_list(:user, 5)
          followee_users.map do |followee|
            create(:follower, followee_id: followee.id, follower_id: user.id).followee
          end
        }
        expect(user.followees_count).to be(followees.count)
      end
    end
  end
end
