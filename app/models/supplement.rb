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

  REMIND_DAY = {
    0 => 0,
    1 => 1,
    2 => 2,
    3 => 3,
    4 => 5,
    5 => 7,
    6 => 10,
    7 => 14,
  }.freeze

  def empty_date_and_time
    created_at.next_day(remaining_quantity / daily_intake)
  end

  def empty_date
    empty_date_and_time.strftime('%F')
  end

  def remind_day
    enum_remind_number = Supplement.reminds[self.remind]
    if enum_remind_number == 0
      nil
    else
      self.empty_date_and_time.prev_day(REMIND_DAY[enum_remind_number]).strftime('%F')
    end
  end
end
