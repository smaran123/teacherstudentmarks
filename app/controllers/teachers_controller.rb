class TeachersController < ApplicationController
  layout :get_admin_layout

  def index
    @teachers = User.where(:role => "teacher").all
    @user = User.where(:role => "admin").last
  end

  def assign_class
   @admin = User.where(:role => "admin").last
   @teacher = User.where(:role => "teacher").last
  #  @teachers = User.where("user_id = '#{current_user.id}' AND role = 'teacher'").all
   puts"#####"
      puts @admin.inspect
   puts"#####"
   @assign_class = Teacherclass.new
 end

 def assign_teachercls
  if params[:subject_ids]
    params[:subject_ids].compact.each do |ami|
      @batch = Teacherclass.find_by_batch_id_and_subject_id(params[:batch_id],ami)
      if !@batch.present? and ami.present?
        @subject = Teacherclass.new(:batch_id => params[:batch_id],:subject_id => ami,:user_id => params[:user_id])
        @subject.save
 @subject.subject.update_attribute(:assign, "Assigned")      end
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
