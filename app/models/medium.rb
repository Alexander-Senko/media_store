class Medium < ActiveRecord::Base
	mount_uploader :data, MediaStore::Uploader, mount_on: :filename

	serialize :metadata
end
