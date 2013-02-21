MediaStore::Engine.routes.draw do
	resources :media

	root :to => 'media#index'
end
