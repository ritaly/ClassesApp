class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :lecture_id
      t.integer :plan_id

      t.timestamps null: false
    end
  end
end
