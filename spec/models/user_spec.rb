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
end
