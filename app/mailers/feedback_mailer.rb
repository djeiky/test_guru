class FeedbackMailer < ApplicationMailer
  def send_email(message, from)
    @message = message
    @from = from

    mail to: Admin.first.email,
        subject: "Test Guru feedback",
        from: @from
  end
end
