Rails.application.routes.draw do
  devise_for :users
  resources :users
  # get 'articles/index'
  # get('/articles', {to: 'articles#index'} )
  # get "/articles/new", to: "articles#new"
  # get "/articles/:id", to: "articles#destroy"
  resources :articles do
    resources :comments
  end
  root "articles#index"
end
