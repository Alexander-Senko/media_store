MediaStore::Engine.routes.draw do
	concern :media do
		resources :images
		resources :media, path: '/'
	end

	concerns :media

	resources :lists, concerns: :media do
		resources :lists
	end
end
