class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
       t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.date :date_of_birth
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
