class SendsmsController < ApplicationController
  # has_sms_fu
  include SMSFu


  def new
    puts "in NEW send text"
  end

  def create
    puts "in create send text"


      render json: {errors: 'testing.'}


  end

end
