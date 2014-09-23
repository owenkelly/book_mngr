Rails.application.routes.draw do  

  
  devise_for :users
  resources :users, only: :destroy

  root 'books#index'

  get 'tags/:tag', to: 'books#search', as: :tag
  
  get 'users/:id/profile', to: "users#profile", as: :users

  get 'admin', to: 'users#admin', as: :admin

  post 'adminize/:id', to: "users#adminize", as: :adminize

  post 'restrict/:id', to: "users#restrict", as: :restrict

  post 'unrestrict/:id', to: "users#unrestrict", as: :unrestrict

  resources :followings, only: [:create, :destroy, :update]
     
  get "books/:id/disable", to: "books#disable", as: :disable_book
  post "books/:id/approve", to: "books#approve", as: :approve_book

  resources :books do
    collection do
      match 'search' => 'books#search', via: [:get, :post], as: :search
      match ':id/search' => "books#singlesearch", via: [:get, :post], as: :singlesearch
    end
    resources :reviews, except: [:show, :index]
  end

  
end
