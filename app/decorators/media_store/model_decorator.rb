module MediaStore
	class ModelDecorator < Draper::Decorator
		delegate_all
		delegate :as_json

		class_attribute :actions, :bulk_actions, :flags

		self.actions = [ :show, :edit, :destroy ]
		self.flags   = [ :selectable ]

		def self.inherited subclass
			subclass.bulk_actions = subclass.actions -
				[ :show ]
		end


		def self.human_name
			source_class.model_name.human count: -1 # plural
		end

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
			decorate_actions self.class.actions
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

		private

		def decorate_actions actions, options = {}
			ActionsDecorator.new(actions,
				{ context: source }.merge(options)
			).for self
		end
	end
end
