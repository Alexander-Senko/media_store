require_dependency 'media_store/api_controller'

module MediaStore::API
	class ListsController < MediaStore::APIController
		belongs_to :list, optional: true
	end
end
