FactoryBot.define do
  factory :user do
    id { 1 }
    email { "test@example.com" }
    password { "testtest" }
  end
end
