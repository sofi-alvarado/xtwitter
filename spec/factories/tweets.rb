require 'faker'

FactoryBot.define do
  factory :tweet do
    user
    content { Faker::Lorem.characters(number: 255) }
    quote { Faker::Lorem.characters(number: 255) } 
  end
end
