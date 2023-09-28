require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe "associations" do
    it { should belong_to(:following_user,).class_name("User").with_foreign_key(:following_user_id) }
    it { should belong_to(:follower_user,).class_name("User").with_foreign_key(:follower_user_id) }
  end
end
