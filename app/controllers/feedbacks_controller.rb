class FeedbacksController < ApplicationController
  def new
  end

  def create
    mail_params = { subject: params[:subject], body: params[:body] }
    FeedbacksMailer.user_feedback(mail_params).deliver_now
    redirect_to result_feedbacks_path
  end

  def result
  end
end
