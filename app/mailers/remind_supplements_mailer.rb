class RemindSupplementsMailer < ApplicationMailer
  def remind_supplement(user, supplement)
    @user = user
    @supplement = supplement
    mail to: user.email, subject: '登録されたサプリメントのリマインドメールです。'
  end
end
