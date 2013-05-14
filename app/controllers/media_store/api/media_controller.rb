require_dependency 'media_store/api_controller'

module MediaStore::API
	class MediaController < MediaStore::APIController
		belongs_to :list, optional: true

		private

		def permitted_resource_params
			[
				:data,

				I18n.available_locales.each_with_object({}) { |lang, hash|
					hash[:"description_#{lang}_attributes"] = [ :id ] +
						TranslatableDescriptions.editable_attributes
				}
			]
		end
	end
end
