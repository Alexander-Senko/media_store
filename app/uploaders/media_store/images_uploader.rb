module MediaStore
	class ImagesUploader < Uploader
		# TODO: make DB-driven

		process :auto_orient

		version :thumbnail do
			process :resize_to_fit => [ 150, 150 ]
		end

		version :preview do
			process :resize_to_fit => [ 600, 600 ]
			process :set_watermark
		end

		protected

		def auto_orient
			manipulate! do |image, index, options|
				image.auto_orient!
			end
		end
	end
end
