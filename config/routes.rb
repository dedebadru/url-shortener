Rails.application.routes.draw do
  resources :shorteners, except: :show
	get ':short_url', to: 'shorteners#redirect', as: :short
  root "shorteners#index"
end
