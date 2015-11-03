class StudentsController < ApplicationController
  layout :get_students_layout

  def index
   # @students = User.where(:role => "student").all
     @students = Student.all
  end

  def student_marks
    @markreports = Markreport.all
    @teacherclass = Teacherclass.all
    puts "####"
    puts "####"
puts @teacherclass.inspect
  puts "####"
    puts "####"
  end
end
