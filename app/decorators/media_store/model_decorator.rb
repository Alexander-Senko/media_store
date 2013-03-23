module MediaStore
	class ModelDecorator < Draper::Decorator
		delegate_all
		delegate :as_json

		class_attribute :actions

		self.actions = [ :show, :edit, :destroy ]

		def html_class
			[
				self.class.model_name.element,
			]
		end

		def human_name
			"#{self.class.model_name.human} #{human_id}"
		end

		def human_id
			"#{model.class.human_attribute_name :id}#{model.id}"
		end

		def actions
			ActionsDecorator.new(self.class.actions).
				for self
		end
	end
end
