FactoryBot.define do
  factory :like do
    tweet { nil }
    user { nil }
    likes_count { 1 }
  end
end
