require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  describe "associations" do
    it { should have_many(:taggings) }
    it { should have_many(:tweets).through(:taggings) }
  end
  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end
