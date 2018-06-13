class OwnerMailer < ApplicationMailer
	default from: "Nhurtado@miuandes.cl"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.owner_mailer.funding_notification.subject
  #
  def funding_notification(user)
    @greeting = "You have a new pending fund for your project"

    mail to: user.email, subject: "PunchStopper - You have a new pending fund for your project."
  end
end
