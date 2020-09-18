Rails.application.routes.draw do
  root 'backups#index'
  resources :backups
end
