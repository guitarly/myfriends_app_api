# ActionMailer delivery
@sms_fu = SMSFu::Client.configure(:delivery => :action_mailer)

# Pony delivery via Sendmail
@sms_fu = SMSFu::Client.configure(:delivery => :pony, :pony_config => { :via => :sendmail })

# Pony delivery via SMTP
@PONY_CONFIG = {
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :user_name            => 'mefriends2017',
    :password             => 'testmonday1!',
    :authentication       => :plain,
    :enable_starttls_auto => true,
    :domain               => "gmail.com"
}}

@sms_fu = SMSFu::Client.configure(:delivery => :pony, :pony_config => @PONY_CONFIG)
