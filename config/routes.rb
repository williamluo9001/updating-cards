Rails.application.routes.draw do

  devise_for :users
  # You can have the root of your site routed with "root"
  root 'welcome#index'

end
