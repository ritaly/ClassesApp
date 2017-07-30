class List < ActiveRecord::Base
  belongs_to :plan
  belongs_to :lecture
  belongs_to :order
  #validate :lecture_cannot_be_added_twice, on: :create
  #validates_uniqueness_of :lecture_id, scope: :plan_id 
  
  def total_point
    lecture.etcs_point
  end


  #curent_lecture = @plan.lists.find_by(lecture_id: lecture)
  #def lecture_cannot_be_added_twice
  #  if curent_lecture
  #    errors.add(:lecture_id, "You can't add this lecture again, choose sth else")
  #  end
  #end

end
