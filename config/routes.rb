Rails.application.routes.draw do
  resources :courses
  resources :categories
  resources :verticals
  apipie
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
