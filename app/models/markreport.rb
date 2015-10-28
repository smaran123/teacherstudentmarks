class Markreport < ActiveRecord::Base
belongs_to :student
belongs_to :teacher
belongs_to :subject
end
