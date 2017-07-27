class Lecture < ActiveRecord::Base
  validates :name, :short_name, :description, :etcs_point, presence: true
  validates :name, :short_name, uniqueness: true
  validates :etcs_point, numericality: {greater_than: 0}
  #validates :ectc_point, only_integer: true - bo jak nic nie wpisze to sie wywali
end
