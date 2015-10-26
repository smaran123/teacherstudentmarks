class Teacher < ActiveRecord::Base
  belongs_to :user
  has_many :teacherclasses, :dependent => :destroy
end
