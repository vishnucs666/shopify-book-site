Rails.application.routes.draw do
  root 'home#index'
  get '/products/create'
  get '/products/show'
end
