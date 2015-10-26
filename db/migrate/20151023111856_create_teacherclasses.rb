class CreateTeacherclasses < ActiveRecord::Migration
  def change
    create_table :teacherclasses do |t|
      t.integer :user_id
      t.integer :batch_id
      t.integer :subject_id
      t.timestamps null: false
    end
  end
end
