class AddTeacherIdToTeacherclasses < ActiveRecord::Migration
  def change
    add_column :teacherclasses, :teacher_id, :integer
  end
end
