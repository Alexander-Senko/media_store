require_dependency 'media_store/api/media_controller'

module MediaStore
	class MediaController < API::MediaController
		private

		def permitted_resource_params
			[
				:data,

				descriptions_attributes: [ :id,
					:title, :abstract, :body, :lang
				]
			]
		end
	end
end
