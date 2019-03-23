class FeedbackController < ApplicationController
  def new
  end

  def send_email
    message = params[:message]
    render :new , alert: "Message can't be blank" unless message

    FeedbackMailer.send_email(message, current_user.email).deliver_now
    redirect_to tests_path, notice: "We recieved your mail"

  #rescue StandartError => e
    #render :new, alert: e.message
  end
end
