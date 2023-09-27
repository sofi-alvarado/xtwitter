require 'faker'

FactoryBot.define do
  factory :follow do
    association :follower_user, factory: :user
    association :following_user, factory: :user
  end
end
