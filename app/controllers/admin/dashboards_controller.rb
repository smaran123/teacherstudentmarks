class Admin::DashboardsController < ApplicationController
  
#layout :get_school_layout, :except => ['edit', 'update' 'destroy']
layout :get_admin_layout
  def index
    # @user = User.find(params[:id])
    @students = User.where(:role => "student").all
    @teachers = User.where(:role=>"teacher").all
     @batches = Batch.all
    # @assign_class = Teacherclass.new
  end
end
