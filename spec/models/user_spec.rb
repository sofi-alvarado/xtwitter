require 'rails_helper'
# Model test
RSpec.describe User, type: :model do
  context "associations" do
    it { should have_many(:follows_as_following) }
    it { should have_many(:follows_as_follower) } 
    it { should have_many(:tweets) }
    it { should have_many(:replies) }
    it { should have_many(:bookmarks) }
    it { should have_many(:likes) }
  end

  it 'return user' do
    user = create(:user)
  end

  context "validations" do
   
      it { should validate_presence_of(:name).with_message("needs to have a value") }
      it { should validate_presence_of(:username).with_message("needs to have a value")  }
      it { should validate_presence_of(:email).with_message("needs to have a value")  }
      it do 
        should validate_length_of(:password).is_at_least(12).on(:user)
      end
  end

end
