class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :admins, :dependent => :destroy
    has_many :students, :dependent => :destroy
    has_many :teachers, dependent: :destroy
    accepts_nested_attributes_for :admins, :allow_destroy => true, :reject_if=>:all_blank
    accepts_nested_attributes_for :students, :allow_destroy => true, :reject_if=>:all_blank
    accepts_nested_attributes_for :teachers, :allow_destroy => true, :reject_if=>:all_blank
    has_many :teacherclasses, :dependent => :destroy
    
end
