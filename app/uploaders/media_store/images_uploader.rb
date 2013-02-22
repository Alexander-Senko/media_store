module MediaStore
	class ImagesUploader < Uploader
		# TODO: make DB-driven

		version :thumbnail do
			process :resize_to_fit => [ 150, 150 ]
		end

		version :preview do
			process :resize_to_fit => [ 600, 600 ]
			process :set_watermark
		end
	end
end
