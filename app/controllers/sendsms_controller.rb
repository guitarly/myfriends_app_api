class SendsmsController < ApplicationController
  # has_sms_fu
  # include SMSFu


  def new
    puts "in NEW send text"
  end

  def create
    puts "in create send text"

    # sms_fu = SMSFu::Client.configure(delivery: :pony, pony_config: { via:  :sendmail })
    #
    #
    # puts sms_fu
    #
    # # @Pony_config = {via: "smtp"}
    #
    # @PONY_CONFIG = {via: :smtp,
    #   via_options: {
    #       address:               'smtp.gmail.com',
    #       port:                  '587',
    #       user_name:             'mefriends2017@gmail.com',
    #       password:              'testmonday1!',
    #       authentication:        :plain,
    #       enable_starttls_auto:  true,
    #       domain:                "localhost.localdomain"
    #         }
    #       }
    #
    #   sms_fu = SMSFu::Client.configure(delivery: :pony, pony_config: @PONY_CONFIG)

      # sms_fu.deliver("7035770516", "verizon", "hello .. testing", from: "mefriends2017@gmail.com")
      # sms_fu = SMSFu.sms_address("7035770516","verizon")

      render json: {errors: 'testing.'}


  end

end
