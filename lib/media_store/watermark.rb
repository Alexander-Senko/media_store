module MediaStore
	module Watermark
		protected

		def set_watermark
			for watermark in watermarks do
				manipulate! do |image, index, options|
					image.composite! watermark.tap { |watermark|
						watermark.resize_to_fit! image.columns, image.rows
					}, Magick::CenterGravity, Magick::OverCompositeOp
				end
			end
		end

		private

		def watermarks
			# TODO: load watermarks
			Magick::Image.read Rails.root.join("public/#{model.class.name.pluralize.underscore}/watermark.png")
		end
	end
end
