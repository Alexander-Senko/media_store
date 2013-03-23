require 'rails'
require 'active_record'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'inherited_resources'
require 'has_scope'
require 'kaminari'
require 'cancan'
require 'haml'
require 'shared_form-rails'
require 'draper'

require 'media_store/engine'

module MediaStore
	autoload :Storage,   'media_store/storage'
	autoload :Watermark, 'media_store/watermark'

	def self.i18n_scope
		name.underscore.to_sym
	end
end
