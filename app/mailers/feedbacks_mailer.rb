class FeedbacksMailer < ApplicationMailer
  def user_feedback(mail_params)
    admin_address = "testguru.mail.client@gmail.com"
    mail to: admin_address, subject: mail_params[:subject], body: mail_params[:body]
  end
end
