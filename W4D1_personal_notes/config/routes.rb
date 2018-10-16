Rails.application.routes.draw do

  # generates eight routes.
  resources :users

# Router tries to match a Route based on the HTTP
# method and the url path (it does this with a
# regular expression,

# first matched route = instantiates instance of specified
# controller -> call specified action on it.
  # get "/users", to: "users#index"
  # get "/users/:id", to: "user#show"
  # post "/users/:id", to: "users#create"
  # get "/users/:new", to: "users#new"
  # get "/users/:id/edit", to: "users#edit"
  # patch "/users/:id", to: "users#update"
  # put "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"

end
