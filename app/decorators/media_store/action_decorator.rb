module MediaStore
	class ActionDecorator < Draper::Decorator
		delegate_all
		delegate :to_s
		delegate :object, to: :context

		def html_class
			[
				:action,
				source,
				current? && 'current',
			]
		end

		def i18n_scope
			"#{MediaStore.i18n_scope}.actions"
		end

		def human_name
			defaults = (Class === object ? object : object.class).
				lookup_ancestors.map do |model|
					:"#{i18n_scope}.#{model.model_name.i18n_key}.#{source}"
				end
			defaults << :"actions.#{source}"
			defaults << source.to_s.humanize

			h.translate defaults.shift, default: defaults
		end

		def path
			MediaStore::Engine.recognize_path(
				h.polymorphic_path object
			).merge action: source
		end

		def options
			case source
			when :destroy
				{ method: :delete, data: {
					confirm: h.t('media_store.confirm',
						action: human_name, subject: object.human_name
					),
				} }
			else
				{}
			end
		end

		def current?
			h.current_page? path and
				options.blank?
		end
	end
end
