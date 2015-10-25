class TeachersController < ApplicationController
  layout :get_admin_layout

  def index
    @teachers = User.where(:role => "teacher").all
  end

  def assign_class
  #  @user = User.find(params[:id])
    @assign_class = Teacherclass.new
  end

  def assign_teachercls
   @assign_class = Teacherclass.new
  end

  def assign_subject
    @subjects = Subject.where("assign is null and batch_id = ?" , params[:batch_id])
  end




end
