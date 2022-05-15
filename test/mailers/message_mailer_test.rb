require "test_helper"

class MessageMailerTest < ActionMailer::TestCase
  test "message_sent" do
    mail = MessageMailer.message_sent
    assert_equal "Message sent", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
