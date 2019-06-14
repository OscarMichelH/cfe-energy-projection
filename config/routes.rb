Rails.application.routes.draw do
  resources :cfe_consumptions do
    collection { post :import }
  end

  root to: 'cfe_consumptions#new'
end
