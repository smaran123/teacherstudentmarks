class CreateTeacherclasses < ActiveRecord::Migration
  def change
    create_table :teacherclasses do |t|

      t.timestamps null: false
    end
  end
end
