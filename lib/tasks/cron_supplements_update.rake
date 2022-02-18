namespace :cron_supplements_update do
  desc "cronを実行しサプリメントの残量を更新"
  task update_supplements_remaining: :environment do
    logger = Logger.new 'log/upate_supplements_remaining.log'

    supplements = Supplement.all
    supplements.each do |supplement|
      if supplement.content_size <= supplement.daily_intake
        supplement.content_size = 0
      else
        supplement.content_size -= supplement.daily_intake
      end
      supplement.save
    end

    #デバッグのため
    p "ここまでOK"
  end
end
