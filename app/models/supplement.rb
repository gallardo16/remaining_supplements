class Supplement < ApplicationRecord
  belongs_to :user

  def remaining_quantity
    content_size - total_intake.to_i
  end

  def total_intake
    day_of_keep_taking_supplement * daily_intake
  end

  def day_of_keep_taking_supplement
    Date.today.strftime('%F').to_i - updated_at.strftime('%F').to_i
  end

  def empty_date
    updated_at.next_day(content_size / daily_intake).strftime('%F')
  end
end
