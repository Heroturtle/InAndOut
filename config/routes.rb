Rails.application.routes.draw do
	resources :entries
	resources :categories

	get '/einstellungen', to: 'settings#index', as: :einstellungen
end
