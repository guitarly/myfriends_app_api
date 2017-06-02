class SendsmsController < ApplicationController
  # @has_sms_fu
  # include SMSFu


  def new
    puts "in NEW send text"
  end

  def create
    puts "in create send text"
    puts params[:friend]
    @friend = params[:friend]

    UserEmailMailer.notify_user(@friend).deliver

  end

  def sendEmail
    puts "--- send email "
    puts params
    puts params[:friend]
    @friend = params[:friend]
    puts @friend[:emailText]
    puts "--------"
    
    UserEmailMailer.notify_user(@friend).deliver
  end

  def sendText
    @friend = params[:friend]
    puts @friend
    # send text in usa only.. phone# has to be 10 digits.
    puts "sending... text"



    # # Create the client
    # easy = SMSEasy::Client.new
    # # Deliver a simple message.
    # easy.deliver("7035770516", "verizon", "Hey!")
    render json: {errors: 'testing.'}


  end

end
