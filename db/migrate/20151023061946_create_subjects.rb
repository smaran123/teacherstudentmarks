class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject_name
      t.references :batch, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
