desc "This task is called by the Heroku scheduler add-on"
task :update_supplements_remaining => :environment do
  supplements = Supplement.all
  supplements.each do |supplement|
    if supplement.remaining_quantity <= supplement.daily_intake
      supplement.remaining_quantity = 0
    else
      supplement.remaining_quantity -= supplement.daily_intake
    end
    supplement.save
  end
end
