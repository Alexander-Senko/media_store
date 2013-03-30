MediaStore::Engine.routes.draw do
	concern :bulk_actions do
		get    ':action', on: :collection, action: /[a-z_]+/
		delete ':action', on: :collection, action: /[a-z_]+/
	end

	concern :media do
		resources :images, concerns: :bulk_actions
		resources :media,  concerns: :bulk_actions, path: '/'
	end

	concerns :media

	resources :lists, concerns: :media do
		resources :lists
	end
end
