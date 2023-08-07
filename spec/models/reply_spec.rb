require 'rails_helper'

RSpec.describe Reply, type: :model do
  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:tweet) }
    it { should belong_to(:reply) }
  end

  context "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(255) }
  end

end
