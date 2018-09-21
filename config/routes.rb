Rails.application.routes.draw do
  root "tasks#index"

  get '/tasks', to: 'tasks#index', as: 'tasks'
  # order matters new must be before id
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  # the following route is used by the form? and the default of form is post
  post '/tasks', to: 'tasks#create'
  #
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update'

  #
  get '/tasks/:id', to: 'tasks#show', as: 'task'
  #
  put '/tasks/:id', to: 'tasks#update'
  #
  # delete '/tasks/:id', to: 'tasks#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
