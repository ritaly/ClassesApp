class Plan < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  has_many :lectures, through: :lists

  def total_point
      #lists.to_a.sum { |item| item.total_point } #boszewzyciubymtakiejlininienapisala
      #iterator szatana
      lists.to_a.sum(&:total_point)
  end
end
