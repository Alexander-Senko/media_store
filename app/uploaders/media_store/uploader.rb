module MediaStore
	class Uploader < CarrierWave::Uploader::Base
		include CarrierWave::RMagick

		# Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
		include Sprockets::Helpers::RailsHelper
		include Sprockets::Helpers::IsolatedHelper

		include Storage
		include Watermark

		# Provide a default URL as a default if there hasn't been a file uploaded:
		# def default_url
		#   # For Rails 3.1+ asset pipeline compatibility:
		#   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
		#
		#   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
		# end

		# Add a white list of extensions which are allowed to be uploaded.
		# For images you might use something like this:
		# def extension_white_list
		#   %w(jpg jpeg gif png)
		# end

		# Override the filename of the uploaded files:
		# Avoid using model.id or version_name here, see uploader/store.rb for details.
		# def filename
		#   "something.jpg" if original_filename
		# end
	end
end
