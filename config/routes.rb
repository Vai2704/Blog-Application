Rails.application.routes.draw do
  get 'newpost', to: 'post#new'
  post 'posts', to: 'post#create'
  get 'post/:id', to: 'post#view'
  get 'post/:id/edit', to: 'post#edit', as: 'edit_post'
  patch 'post/:id', to: 'post#update', as: 'post'
  delete 'post/:id', to: 'post#destroy'

  post 'post/:post_id/comments', to: 'comments#create', as: 'post_comments'
  delete 'post/:post_id/comments/:id', to: 'comments#destroy', as: 'delete_comment'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "dashboard#index"
end
