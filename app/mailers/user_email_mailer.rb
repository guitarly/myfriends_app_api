# include SMSFu
class UserEmailMailer < ApplicationMailer


  def notify_user(friend)

    @friend = friend
    # @phone = "7035770516@vtext.com"

    @email = @friend[:email]
    @emailText = @friend[:emailText]
    @subject = @friend[:subject]
    @sender = @friend[:sender]
    # @senderEmailText = "This is my email:" + @sender

    puts @emailText, @email, @sender
    mail from: @sender, to: @email, subject: @subject

  end
end
