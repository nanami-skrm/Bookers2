Rails.application.routes.draw do
  devise_for :users #dviseを使用する際にURLにuserを含む
  root 'books#index'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
