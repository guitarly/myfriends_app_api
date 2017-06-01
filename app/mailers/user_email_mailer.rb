# include SMSFu
class UserEmailMailer < ApplicationMailer


  def notify_user(friend)

    @friend = friend
    # @phone = "7035770516@vtext.com"
    # Testing... send email
    @myemail = "guitarly@gmail.com"
    mail to: @myemail, subject: "welcome"

  end
end
