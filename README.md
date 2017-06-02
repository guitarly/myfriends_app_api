# README
Setup for the application backend. (Me and Friend appliction )
- Ruby 2.3.3p222
- postgresql

Gem:
- gem 'rack-cors' (middleware - communicate with Express)
- gem 'bcrypt', '~> 3.1.7' - Use ActiveModel has_secure_password
- gem 'jwt'     -  Jwt - json web token
- gem 'geocoder' - to geocode lat/long of the address
- gem 'sms-easy'  - send text meassage.

Need to setup ActionMailer to be able to send email/text. (more information - https://launchschool.com/blog/handling-emails-in-rails)

- Create two models:
  - User
  - Friend.
  (one to many)
  
  
