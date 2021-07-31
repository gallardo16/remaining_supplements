FactoryBot.define do
  factory :supplement do
    name { "foo" }
    supplement_type { "tablet" }
    content_size { 100 }
    daily_intake { 1 }
    remind { 2 }
    user_id { 1 }
  end
end
