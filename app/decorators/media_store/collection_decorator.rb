module MediaStore
	class CollectionDecorator < Draper::CollectionDecorator
		include Draper::AutomaticDelegation
		singleton_class.delegate :source_class, :source_class?, to: :inferred_decorator_class

		class_attribute :actions

		self.actions = [ :new ]

		def actions
			decorate_actions self.class.actions,
				context: decorator_class.source_class
		end

		def bulk_actions
			decorate_actions map(&:bulk_actions).flatten.uniq
		end

		private

		def item_decorator
			@item_decorator ||= -> (item, options) {
				item.decorate options
			}
		end

		def decorate_actions actions, options = {}
			ActionsDecorator.new(actions,
				{ context: source }.merge(options)
			).for decorator_class
		end
	end
end
