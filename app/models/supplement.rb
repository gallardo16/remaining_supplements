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

  def keep_taking_days
    ((Time.current - created_at) / 1.day).to_i + 1
  end

  def total_intake
    (keep_taking_days * daily_intake).to_i
  end

  def remaining_quantity
    content_size - total_intake
  end

  def empty_date
    created_at.next_day(content_size / daily_intake).strftime('%F')
  end
end
