class FeedbacksController < ApplicationController
  def new
  end

  def create
    mail_params = { subject: params[:subject], body: params[:body] }
    FeedbacksMailer.user_feedback(mail_params).deliver_now
    redirect_to new_feedback_path, notice: t('.msg')
  end
end
