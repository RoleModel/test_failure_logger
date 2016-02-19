Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :test_results
  end
end
