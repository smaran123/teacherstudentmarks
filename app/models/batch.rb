class Batch < ActiveRecord::Base
  belongs_to :admin
  has_many :subjects, :dependent => :destroy
  has_many :teacherclasses, :dependent => :destroy
  accepts_nested_attributes_for :subjects, :allow_destroy => true, :reject_if=>:all_blank

end
