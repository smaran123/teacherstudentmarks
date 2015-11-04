class Markreport < ActiveRecord::Base
belongs_to :student
belongs_to :teacher
belongs_to :subject
validates :teacher_id,:max_marks,:total_marks, :presence => true

 # validate :subject_validation

 validate :student_mark_must_be_unique

  private

  # def subject_validation
  #   if Subject.where("(subject_id=? AND student_id=?) OR (student_id=? AND subject_id=?)", @subject.id, self.student_id, self.student_id, @subject.id).any?
  #     errors.add(:subject, "subject for this marks exists")
  #   end
  # end




def student_mark_must_be_unique
    for m in Markreport.all
      if (m.student.id == student_id) && (m.subject_id == subject_id)
          errors.add(:base, "the student entered already has a mark for this subject!")
        return false
      end
    end
    return true
  end


end
  