class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :short_name
      t.integer :etcs_point
      t.text :description

      t.timestamps null: false
    end
  end
end
