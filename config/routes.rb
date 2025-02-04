Rails.application.routes.draw do
  resources :user_books
  resources :users
  
  root 'user_books#index'

  post 'books/new'
  get 'books/delete'

  resources :books do
    member do
      get :delete
    end
  end
end
