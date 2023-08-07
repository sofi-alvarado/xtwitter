require 'rails_helper'

RSpec.describe Follower, type: :model do
  context "association" do
    it { should belong_to(:follower).class_name("User").with_foreign_key(:follower_id) } 
    it { should belong_to(:followee).class_name("User").with_foreign_key(:followee_id) } 
  end
end
