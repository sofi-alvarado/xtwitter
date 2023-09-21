FactoryBot.define do
  factory :reply do
    tweet { nil }
    user { nil }
    quote { "MyText" }
  end
end
