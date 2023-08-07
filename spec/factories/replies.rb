FactoryBot.define do
  factory :reply do
    body { Faker::Lorem.characters(number: 255)}
    user { create(:user) }
    tweet { create(:tweet) }
  end
end
