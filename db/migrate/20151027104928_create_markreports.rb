class CreateMarkreports < ActiveRecord::Migration
  def change
    create_table :markreports do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.integer :subject_id
      t.integer :max_marks
      t.float :total_marks
      t.string :result

      t.timestamps null: false
    end
  end
end
