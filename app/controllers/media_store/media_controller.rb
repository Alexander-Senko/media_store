require_dependency 'media_store/api/media_controller'
require_dependency 'action_controller/bulk_actions'

module MediaStore
	class MediaController < API::MediaController
		include ActionController::BulkActions
	end
end
