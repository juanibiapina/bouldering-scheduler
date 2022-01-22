Rails.application.routes.draw do
  resources :sessions, defaults: { format: :json }
end
