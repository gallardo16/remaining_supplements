# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "Remaining Supplements"
  layout "mailer"
end
