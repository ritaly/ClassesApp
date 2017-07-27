class Lecture < ActiveRecord::Base

  validates :name, :short_name, :description, :etcs_point, presence: true
  validates :name, :short_name, uniqueness: true
  validates :etcs_point, numericality: {greater_than: 0}
  #validates :ectc_point, only_integer: true - bo jak nic nie wpisze to sie wywali\
  has_many :lists
  before_destroy :ensure_not_referenced_by_any_list

  private
  def ensure_not_referenced_by_any_list
    if list.empty?
      return true
    else
      errors.add(:base, 'List not empty')
      return false
    end
  end
end
