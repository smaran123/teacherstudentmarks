Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  namespace :admin  do
    resources :dashboards
    resources :batches do 
     get :display_subjects
   end
 end

 resources :teachers do
   get :assign_subject 
   member do 
    get :assign_class
    post :assign_teachercls
  end 
end
resources :students
resources :subjects do 
  member do
    get :teacherclass
  end
collection do
      post :teacherclass_marks
end

end

end
