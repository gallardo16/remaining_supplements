desc "This task is called by Heroku schduler add-on"
task :remind_mail_of_supplement => :environment do
  users = User.all
  users.each do |user|
    user.supplements.each do |supplement|
      if supplement.remind_day == Date.today.to_s
        RemindSupplementsMailer.remind_supplement(user, supplement).deliver
      end
    end
  end
end
