class Teacher < ActiveRecord::Base
  belongs_to :user
  has_many :teacherclasses, :dependent => :destroy
  has_many :markreports, :dependent =>:destroy

end
