class Plan < ActiveRecord::Base
  has_many :lists, :dependent => :destroy
  has_many :lectures, through: :lists
end
