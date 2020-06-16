Rails.application.routes.draw do
  root 'home#index'
  get '/products/create'
  get '/products/show'
  get '/products/product_list'
  get '/products/checkout'
end