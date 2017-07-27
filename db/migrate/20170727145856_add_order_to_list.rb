class AddOrderToList < ActiveRecord::Migration
  def change
    add_reference :lists, :order, index: true, foreign_key: true
  end
end
