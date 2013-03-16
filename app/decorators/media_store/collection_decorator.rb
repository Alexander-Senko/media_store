module MediaStore
	class CollectionDecorator < Draper::CollectionDecorator
		include Draper::AutomaticDelegation
		singleton_class.delegate :source_class, :source_class?, to: :inferred_decorator_class

		class_attribute :actions

		self.actions = [ :new ]

		def actions
			ActionsDecorator.new(self.class.actions).
				for decorator_class
		end

		private

		def item_decorator
			@item_decorator ||= -> (item, options) {
				item.decorate options
			}
		end
	end
end
