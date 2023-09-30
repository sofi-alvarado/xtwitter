require 'faker'

FactoryBot.define do
  factory :reply do
    association :tweet, factory: :tweet
    association :user, factory: :user
    quote { Faker::Lorem.characters(number: 255) } 
  end
end
