Rails.application.routes.draw do
  root 'backups#index'
  resources :backups, only: %i[index create destroy]
  resources :cards, only: %i[index] do
    collection do
      get :search
    end
  end
end
