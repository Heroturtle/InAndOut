Rails.application.routes.draw do
	resources :expenses
	resources :categories

	get '/einstellungen', to: 'settings#index', as: :einstellungen
end
