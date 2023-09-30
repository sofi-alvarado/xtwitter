require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name}
    lastname { Faker::Name.last_name }
    username { Faker::Internet.unique.username(specifier: name)}
    bio { Faker::Hipster.sentence(word_count: 3) }
    location { Faker::Address.country }
    link { Faker::Internet.url }
    email { Faker::Internet.unique.email(name: name) }
    password { 'hdhshkTTTT111@!!!'}
  end
end
