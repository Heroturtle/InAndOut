Rails.application.routes.draw do
	resources :revenues
	resources :expenses
	resources :categories
	resources :payment_accounts

	get '/einstellungen', to: 'settings#index', as: :einstellungen
end
