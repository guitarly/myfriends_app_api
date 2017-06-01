require 'test_helper'

class UserEmailMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "notify_user" do
    mail = UserEmailMailer.notify_user
    assert_equal "new comment", mail.subject
    assert_equal ["to@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_equal "Hi", mail.body.encoded
  end
end
