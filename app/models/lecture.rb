class Lecture < ActiveRecord::Base

  validates :name, :short_name, :description, :etcs_point, presence: true
  validates :name, :short_name, uniqueness: true
  validates :etcs_point, numericality: {greater_than: 0}
  #validates :ectc_point, only_integer: true - bo jak nic nie wpisze to sie wywali\
  has_many :lists
  has_many :plans, through: :lists
  before_destroy :ensure_not_referenced_by_any_list

  private
  def ensure_not_referenced_by_any_list
    if lists.empty? #usuwanie rekordu nie dziala!
      return true
    else
      errors.add(:base, I18n.t('notice.listerror'))
      return false
    end
  end
end
