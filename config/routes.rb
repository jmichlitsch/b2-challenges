Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :professors
  get "/professors/:id/update", to: "professors#edit"
  patch "/professors/:id", to: "professors#update"
  post "/professors/:id", to: "professors#unenroll"
end
