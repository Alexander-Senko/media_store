module MediaStore
	class ModelDecorator < Draper::Decorator
		delegate_all
		delegate :as_json

		class_attribute :actions, :flags

		self.actions = [ :show, :edit, :destroy ]
		self.flags   = [ :selectable ]

		def html_class
			[
				self.class.model_name.element,
			] + flags
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

		def flags
			self.class.flags.map do |flag|
				flag if send "#{flag}?"
			end
		end

		def selectable?
			self.class.bulk_actions.select { |action|
				h.can? action, model
			}.any?
		end
	end
end
