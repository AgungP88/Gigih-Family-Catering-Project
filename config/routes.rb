Rails.application.routes.draw do
  
  resources :category, :menu, :customer
  # get 'customer/index'
  # get 'customer/show'
  # get 'customer/new'
  # get 'customer/edit'
  # get 'menu/index'
  # get 'menu/show'
  # get 'menu/new'
  # get 'menu/edit'
  # get 'category/index'
  # get 'category/show'
  # get 'category/new'
  # get 'category/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
