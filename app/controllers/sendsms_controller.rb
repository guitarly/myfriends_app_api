
class SendsmsController < ApplicationController
  # @has_sms_fu
  # include SMSFu


  def new
    puts "in NEW send text"
  end

  def create
    # puts "in create send text"
    # puts params[:friend]
    # @friend = params[:friend]
    #
    # UserEmailMailer.notify_user(@friend).deliver

  end

  def sendEmail
    puts "--- send email "

    @friend = params[:friend]


    UserEmailMailer.notify_user(@friend).deliver
  end

  def sendText
    @friend = params[:friend]

    # send text in usa only.. phone# has to be 10 digits.
    puts "sending... text"
    phone =@friend[:phone].gsub(/[^0-9]/,'')
    phoneCarrier = @friend[:phone_company]
    textMessage = @friend[:textMessage]

    # # Create the client
    easy = SMSEasy::Client.new
    # # Deliver a simple message.
    easy.deliver(phone, phoneCarrier, textMessage)
    render json: {message: 'Sent text successful'}


  end

end
