class Subject < ActiveRecord::Base
  belongs_to :batch
  has_many :teacherclasses, :dependent => :destroy
  has_one :markreport, :dependent =>:destroy
end
