MediaStore::Engine.routes.draw do
	resources :media
	resources :images

	root :to => 'media#index'
end
