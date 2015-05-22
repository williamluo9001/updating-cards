Rails.application.routes.draw do

  devise_for :users
  resources :projects do
    resources :cards, shallow: true
  end
  # You can have the root of your site routed with "root"
  root 'welcome#index'

end
