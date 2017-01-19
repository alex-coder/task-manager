FactoryGirl.define do
  factory :user do
    email "test@users.com"
    password "test"
    role :user
  end
end
