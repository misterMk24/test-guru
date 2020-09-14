class FeedbacksController < ApplicationController
  def new
  end

  def create
    mail_params = { subject: params[:subject], body: params[:body] }
    user_email = current_user.email
    FeedbacksMailer.user_feedback(user_email, mail_params).deliver_now
    redirect_to result_feedbacks_path
  end

  def result
  end
end
