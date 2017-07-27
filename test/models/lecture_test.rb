require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  test "lecture attributes must not be empty" do
    lecture = Lecture.new
    assert lecture.invalid?
    assert lecture.errors[:name].any?
    assert lecture.errors[:description].any?
    assert lecture.errors[:short_name].any?
    assert lecture.errors[:etcs_point].any?
  end
  # test "the truth" do
  #   assert true
  # end
end
