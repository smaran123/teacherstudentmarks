class Teacherclass < ActiveRecord::Base
  belongs_to :batch
  belongs_to :subject
  belongs_to :user
end
