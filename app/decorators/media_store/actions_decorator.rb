module MediaStore
	class ActionsDecorator < Draper::Decorator
		delegate :each

		attr_reader :object

		def for object
			self.class.decorate(
				source.select { |action|
					h.can? action, object
				}.map { |action|
					ActionDecorator.new action
				},
			).tap do |actions|
				actions.context = context
				actions.object  = object

				for action in actions do
					action.context = actions
				end
			end
		end

		def html_class
			[
				context.respond_to?(:each) && 'bulk',
			]
		end

		def to_partial_path
			'actions'
		end

		protected

		attr_writer :object
	end
end
