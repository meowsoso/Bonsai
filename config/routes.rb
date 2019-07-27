# == Route Map
#
#       Prefix Verb   URI Pattern                  Controller#Action
#         root GET    /                            pages#home
#        users GET    /users(.:format)             users#index
#              POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#         user PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#    edit_user GET    /users/edit(.:format)        users#edit
#     comments GET    /comments(.:format)          comments#index
#              POST   /comments(.:format)          comments#create
#  new_comment GET    /comments/new(.:format)      comments#new
# edit_comment GET    /comments/:id/edit(.:format) comments#edit
#      comment GET    /comments/:id(.:format)      comments#show
#              PATCH  /comments/:id(.:format)      comments#update
#              PUT    /comments/:id(.:format)      comments#update
#              DELETE /comments/:id(.:format)      comments#destroy
#        login GET    /login(.:format)             session#new
#              POST   /login(.:format)             session#create
#              DELETE /login(.:format)             session#destroy

Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :update, :index]
  get '/users/edit' => 'users#edit', :as => :edit_user
  resources :comments

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
