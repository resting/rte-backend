Rails.application.routes.draw do
  resources :posts
  post 'upload', to: 'upload#create', as: 'upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

