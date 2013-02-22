module MediaStore
	class Image < Medium
		mount_uploader :data, ImagesUploader, mount_on: :filename
	end
end
