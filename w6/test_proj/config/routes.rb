Rails.application.routes.draw do
  get 'users/show'
  get 'users/update'
  get 'users/destroy'
  get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
