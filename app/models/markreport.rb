class Markreport < ActiveRecord::Base
belongs_to :student
belongs_to :teacher
belongs_to :subject
validates :teacher_id,:max_marks,:total_marks, :presence => true
end
