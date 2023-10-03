require 'rails_helper'

RSpec.describe Tagging, type: :model do
    describe "associations" do
        it { should belong_to(:tweets).class_name("Tweet").with_foreign_key(:tweet_id) }
        it { should belong_to(:hashtags).class_name("Hashtag").with_foreign_key(:hashtag_id) }
      end
end
