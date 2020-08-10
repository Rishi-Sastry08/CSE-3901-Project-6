=begin

File Description: Contains routes for our application

=end


Rails.application.routes.draw do
  resources :completed_tasks
  resources :posts
  root 'pages#home'
  
  get'post/complete', to: 'posts#complete', as: :post_complete
  #get 'posts/:id', to: 'posts#show'
  devise_for :users , :controllers => {registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

