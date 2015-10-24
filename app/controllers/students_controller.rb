class StudentsController < ApplicationController
  layout :get_admin_layout

  def index
    @students = User.where(:role => "student").all
  end
end
