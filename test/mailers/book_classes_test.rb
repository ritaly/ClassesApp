require 'test_helper'

class BookClassesTest < ActionMailer::TestCase
  test "received" do
    mail = BookClasses.received
    assert_equal "Received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
