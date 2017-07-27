class Plan < ActiveRecord::Base
  has_many :lists, :dependent => :destroy
end
