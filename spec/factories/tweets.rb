require 'faker'

FactoryBot.define do
  factory :tweet do
    association :user
    content { Faker::Lorem.paragraph }
  end
end
