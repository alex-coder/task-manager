FactoryGirl.define do
  factory :task do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentences(rand(4..8)).join(' ') }
    state { %w(new started finished).sample }
    attachment { Faker::File.file_name }
    user
  end
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    role :user
  end
end
