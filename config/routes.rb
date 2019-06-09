Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :tenders
  resources :proposals
  resources :comments
  resources :categories
  resources :attachments

  post :sign_in, to: 'session#sign_in'

end
