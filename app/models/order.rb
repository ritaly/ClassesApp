class Order < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  validates :first_name, :second_name, :email, presence: true

  def add_lists_from_plan(plan)
    plan.lists.each do |item|
      item.plan_id = nil
      lists << item
    end
  end
end
