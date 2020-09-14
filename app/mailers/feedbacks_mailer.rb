class FeedbacksMailer < ApplicationMailer
  def user_feedback(user_email, mail_params)
    mail to: user_email, subject: mail_params[:subject], body: mail_params[:body]
  end
end
