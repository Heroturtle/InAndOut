Rails.application.routes.draw do
	resources :revenues
	resources :expenses
	resources :categories
	resources :payment_accounts
  resources :assets

	get '/einstellungen', to: 'settings#index', as: :settings
end
