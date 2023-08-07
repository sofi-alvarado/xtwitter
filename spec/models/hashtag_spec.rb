require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  context "association" do
    it { should have_many(:taggings) } 
    it { should have_many(:tweets).through(:taggings) } 
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should allow_value("#hashtag").for(:name) } 
    it { should_not allow_value("#hash tag").for(:name) } 
    it { should_not allow_value("hashtag").for(:name) } 
  end
end
