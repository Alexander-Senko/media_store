module MediaStore
	module ApplicationHelper
		def html_class_for resource
			[
				resource.class.model_name.demodulize.underscore,
			]
		end

		def human_name resource
			"#{resource.class.model_name.human} #{human_id resource}"
		end

		def human_id resource
			"#{resource.class.human_attribute_name :id}#{resource.id}"
		end
	end
end
