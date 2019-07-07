class NotificationMailer < ApplicationMailer
	def notify(error)
    user_email = Rails.application.credentials.notification_user
    @error = error
    mail(to: user_email, subject: "#{Rails.env} : Error calling CoinMarketCap Api")
  end
end
