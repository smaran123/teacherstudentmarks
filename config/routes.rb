Rails.application.routes.draw do
  
  get 'students/index'

  devise_for :users
  root 'home#index'

  namespace :admin  do
    resources :dashboards
    resources :batches
  end

  resources :teachers do
   collection do 
    get :assign_class
    post :assign_teachercls
    get :assign_subject 
   end 
  end
  resources :students
end
