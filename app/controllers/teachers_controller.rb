class TeachersController < ApplicationController
  layout :get_admin_layout

  def index
    @teachers = Teacher.all
  #  @user = User.where(:role => "admin").last
  end

  def assign_class
   @admin = User.where(:role => "admin").last
@teacher = Teacher.find(params[:id])
    puts"#####"
    puts @teacher.inspect
      puts @admin.inspect
       puts"#####"
   @assign_class = Teacherclass.new
 end

 def assign_teachercls

 puts"#####"
  puts"#####"
puts @teacher.inspect
 puts"#####"
  puts"#####"

  if params[:subject_ids]
    params[:subject_ids].compact.each do |ami|
      @batch = Teacherclass.find_by_batch_id_and_subject_id(params[:batch_id],ami)
      if !@batch.present? and ami.present?
        @subject = Teacherclass.new(:batch_id => params[:batch_id],:subject_id => ami,:teacher_id => params[:teacher_id])
        @subject.save
 @subject.subject.update_attribute(:assign, "Assigned") 
      end
    end
  end
  flash[:notice] = "Successfully assign Subject to Teacher"
  redirect_to teachers_path
end



def assign_subject
  puts "#######"
  puts params[:batch_id].inspect
  puts params[:subject_id].inspect
  puts params[:user_id].inspect
  puts "#######"
  @subjects = Subject.where("assign is null and batch_id = ?", params[:teacher_id])
end




end
