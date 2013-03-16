module MediaStore
	class CollectionDecorator < Draper::CollectionDecorator
		include Draper::AutomaticDelegation
		singleton_class.delegate :source_class, :source_class?, to: :inferred_decorator_class

		private

		def item_decorator
			@item_decorator ||= -> (item, options) {
				item.decorate options
			}
		end
	end
end
