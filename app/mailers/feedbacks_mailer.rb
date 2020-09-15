class FeedbacksMailer < ApplicationMailer
  def user_feedback(user_email, mail_params)
    mail to: ENV['SMTP_USERNAME'], subject: mail_params[:subject], body: mail_params[:body]
  end
end
