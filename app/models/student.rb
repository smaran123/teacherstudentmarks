class Student < ActiveRecord::Base
  belongs_to :user
  has_many :markreports, :dependent =>:destroy
end
