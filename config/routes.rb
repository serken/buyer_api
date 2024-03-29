Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :tenders
  resources :proposals
  resources :comments
  resources :categories
  resources :attachments

  post :auth, to: 'session#sign_in'
  delete :auth, to: 'session#destroy'
  get :auth, to: 'session#restore'

end
