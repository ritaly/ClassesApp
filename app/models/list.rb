class List < ActiveRecord::Base
  belongs_to :plan
  belongs_to :lecture
  belongs_to :order
  def total_point
    lecture.etcs_point
  end
end
