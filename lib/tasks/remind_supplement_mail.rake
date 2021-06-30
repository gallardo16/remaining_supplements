desc "This task is called by Heroku schduler add-on"
task :remind_mail_of_supplement => :environmeint do
  users = User.all
  users.each do |user|
    user.supplements.each do |supplement|
      supplement_remind = Supplement.reminds[supplement.remind]
    end
  end
end
