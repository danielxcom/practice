Rails.application.routes.draw do
  # edit will have the template.
  # update makes the request to update.
  # PATCH AND PUTS will be mapped to one controller action such as update. Put replaces entirely. Patches changes a few attributes.
  resources :books, only: [:index, :show, :new, :create, :edit, :update]
end
