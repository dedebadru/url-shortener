Rails.application.routes.draw do
  resources :shorteners, except: :show
	get ':short_url', to: 'shorteners#redirect', as: :short
	get ':short_url/stats', to: 'shorteners#stats', as: :stats
  root "shorteners#index"
end
