Rails.application.routes.draw do
  devise_for :users #dviseを使用する際にURLにuserを含む
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'users#top'
  get 'home/about' => 'users#about'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
