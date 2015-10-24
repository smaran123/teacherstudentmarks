class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

 

 # def after_sign_in_path_for(resource_or_scope)
 #      if resource_or_scope.is_a?(User)
 #       admin_dashboards_path 
 #      end
 #    end




def after_sign_in_path_for(resource)
    if resource.role == "admin"
     admin_dashboards_path 
    elsif resource.role == "teacher"
      teachers_path
   elsif resource.role == "student"
     students_path
   else
    root_path
   end
end









  protected

  def configure_permitted_parameters
   # devise_parameter_sanitizer.for(:sign_up) << :first_name,:last_name,:role, :join_date :role
      devise_parameter_sanitizer.for(:sign_up) {|u| u.permit!}
  end



  def get_admin_layout
    if current_user
      return "admin"
    end
  end



end
