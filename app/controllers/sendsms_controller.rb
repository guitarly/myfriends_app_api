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


      render json: {errors: 'testing.'}


  end

  def send_email
    puts "--- send email "
  end

  def send_text
    # send text in usa only.. phone# has to be 10 digits.

    # Create the client
    easy = SMSEasy::Client.new
    # Deliver a simple message.
    easy.deliver("7035770516", "verizon", "Hey!")


  end

end
