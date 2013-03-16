module MediaStore
	class ActionsDecorator < Draper::Decorator
		delegate :each

		def for object
			self.class.decorate(
				source.select { |action|
					h.can? action, object
				}.map { |action|
					ActionDecorator.new action, context: object
				},
			context: object)
		end

		def to_partial_path
			'actions'
		end
	end
end
