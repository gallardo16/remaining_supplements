desc "This task is called by the Heroku scheduler add-on"
task update_supplements_remaining: :environment do
  supplements = Supplement.all
  supplements.each do |supplement|
    if supplement.content_size <= supplement.daily_intake
      supplement.content_size = 0
    else
      supplement.content_size -= supplement.daily_intake
    end
    supplement.save
  end
end
