require 'rails'
require 'active_record'
require 'sprockets/helpers'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'inherited_resources'
require 'has_scope'
require 'cancan'
require 'haml'
require 'shared_form-rails'

require 'media_store/engine'

module MediaStore
	autoload :Storage,   'media_store/storage'
	autoload :Watermark, 'media_store/watermark'
end
