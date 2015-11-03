class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :admins, :dependent => :destroy
    has_one :student, :dependent => :destroy
    has_one :teacher, dependent: :destroy
    accepts_nested_attributes_for :admins, :allow_destroy => true, :reject_if=>:all_blank
    accepts_nested_attributes_for :student, :allow_destroy => true, :reject_if=>:all_blank
    accepts_nested_attributes_for :teacher, :allow_destroy => true, :reject_if=>:all_blank
    has_many :teacherclasses, :dependent => :destroy
end
