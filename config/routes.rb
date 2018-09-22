Rails.application.routes.draw do
  get '/tasks/all', to: 'tasks#all', as: 'all' # it's getting confused with show so it needs to be up here - why?
  resources :tasks
  root "tasks#index"
  delete '/tasks/:id', to: 'tasks#destroy', as: 'destroy'
  get '/task/:id', to: 'tasks#complete', as: 'complete'
end

# Rails.application.routes.draw do
#   root "tasks#index" # this route is called root_path
#   get '/tasks/all', to: 'tasks#all', as: 'all'
#
#   get '/tasks', to: 'tasks#index', as: 'tasks'
#   # order matters new must be before id because :id will match any string, it is just a place holder
#   get '/tasks/new', to: 'tasks#new', as: 'new_task'
#   # the following route is used by the form? yes! it chooses this one if object doesn't have an idea to create a new object = post
#   post '/tasks', to: 'tasks#create'
#   #
#   get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
#   # the following route is used by the form if the object already exist and to check for this if it it has an id
#   patch '/tasks/:id', to: 'tasks#update' # default http verb for the form
#
#   get '/tasks/:id', to: 'tasks#show', as: 'task'
#
#   # when and by who is this path called?
#   # use put to replace entire task, the form will use this path, but you have to tell it to use (action: :put) this http verb because the default for form is patch
#   put '/tasks/:id', to: 'tasks#update'
#
#   #- why does this need an alias? if not it will match to edit
#   delete '/tasks/:id', to: 'tasks#destroy', as: 'destroy'
#
#   get '/task/:id', to: 'tasks#complete', as: 'complete'
#
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end
