class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.date :date_of_birth
      t.timestamps null: false
    end
  end
end
