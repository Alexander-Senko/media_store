class Description < ActiveRecord::Base
	scope :in_language, -> (lang = I18n.locale) {
		where lang: lang
	}

	def self.editable_attributes
		[ :title, :abstract, :body ]
	end

	def self.hidden_attributes
		[ :lang ]
	end
end
