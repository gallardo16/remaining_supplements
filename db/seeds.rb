# frozen_string_literal: true

user = User.create!(
  email: "test@example.com",
  password: "testtest"
)

user.supplements.create!(
  name: "tablet1",
  supplement_type: "tablet",
  content_size: 100,
  daily_intake: 1,
  remind: "1日前"
)

user.supplements.create!(
  name: "tablet2",
  supplement_type: "tablet",
  content_size: 200,
  daily_intake: 20,
  remind: "2日前"
)

user.supplements.create!(
  name: "powder1",
  supplement_type: "powder",
  content_size: 1000,
  daily_intake: 10,
  remind: "1週間前"
)
user.supplements.create!(
  name: "powder2",
  supplement_type: "powder",
  content_size: 5000,
  daily_intake: 100,
  remind: "2週間前"
)
