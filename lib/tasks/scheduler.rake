desc "This task is called by the Heroku scheduler add-on"
task :update_supplements_remaining => :environment do
  supplements = Supplement.all
  supplements.each do |supplement|
    supplement.remaining_quantity -= supplement.daily_intake
  end
end
