require 'rails_helper'

RSpec.describe Reply, type: :model do
  describe "validations" do
    it { should validate_length_of(:quote).is_at_most(255) }
    it { should validate_presence_of(:quote).with_message("Please enter your text") }
  end

  describe "associations" do
    it { should belong_to(:tweets).class_name("Tweet").with_foreign_key(:tweet_id)  }
    it { should belong_to(:users).class_name("User").with_foreign_key(:user_id) }
  end

end
