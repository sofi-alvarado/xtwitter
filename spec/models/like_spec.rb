require 'rails_helper'

RSpec.describe Like, type: :model do

  describe "associations" do
    it { should belong_to(:tweet) }
    it { should belong_to(:user) }
  end
end
