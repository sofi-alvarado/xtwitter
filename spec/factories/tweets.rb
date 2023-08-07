FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.characters(number: 255)}
    user { create(:user)}
    status { "created" }
  end
end
