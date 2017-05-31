class SendsmsController < ApplicationController
  def new
  end

  def create
    easy = SMSEasy::Client.new
    easy.deliver("7035770516", "verizon", "Hello buddy.")  
  end
end
