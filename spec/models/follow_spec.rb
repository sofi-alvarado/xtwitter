require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe "associations" do
    it { should belong_to(:following_user,).class_name("User").with_foreign_key(:following_user_id) }
    it { should belong_to(:follower_user,).class_name("User").with_foreign_key(:follower_user_id) }
  end

  describe 'validations' do
    
    it 'validates uniqueness of follower_user_id scoped to following_user_id' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      # Create a follow relationship between user1 (follower) and user2 (following user)
      FactoryBot.create(:follow, follower_user_id: user1.id, following_user_id: user2.id)
      follow = FactoryBot.build(:follow, follower_user_id: user1.id, following_user_id: user2.id)

      expect(follow).not_to be_valid
      expect(follow.errors[:follower_user_id]).to include("has already been taken")
    end
  end
end
