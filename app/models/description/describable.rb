require 'active_support/concern'

module Description::Describable
	extend ActiveSupport::Concern

	included do
		scope :translated, -> (lang = I18n.locale) {
			where(descriptions: { lang: lang }).
				includes(:descriptions)
		}

		accepts_nested_attributes_for :descriptions, reject_if: -> (attributes) {
			attributes.values_at(
				*Description.editable_attributes
			).reject(&:blank?).blank?
		}
	end

	def description lang = I18n.locale
		descriptions.in_language(lang).first_or_initialize({
			lang: lang,
		})
	end
end
