class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :second_name
      t.string :email

      t.timestamps null: false
    end
  end
end
