class Supplement < ApplicationRecord
  belongs_to :user

  enum remind: {
    "リマインドなし": 0,
    "1日前": 1,
    "2日前": 2,
    "3日前": 3,
    "5日前": 4,
    "1週間前": 5,
    "10日前": 6,
    "2週間前": 7
  }

  def remaining_quantity
    content_size - total_intake.to_i
  end

  def total_intake
    day_of_keep_taking_supplement * daily_intake
  end

  def day_of_keep_taking_supplement
    (Date.today - registration_date).to_i
  end

  def empty_date
    registration_date.next_day(content_size / daily_intake)
  end
end
